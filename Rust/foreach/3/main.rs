use std::iter::Iterator;

pub enum Continue {
    /// This is default value, it does not change anything.
    Continue,
    /// If this variant is returned, iteration ends.
    Break,
}

impl Default for Continue {
    fn default() -> Continue {
        Continue::Continue
    }
}

impl From<()> for Continue {
    /// Converts `()` to `Continue::Continue`
    fn from(_: ()) -> Continue {
        Continue::Continue
    }
}

/// Trait to simplify usage of iterator inside iteration loop.
///
/// This trait is implemented for all iterators by default.
pub trait ForEach: Iterator {
    /// Iterates over all items and executes given closure.
    ///
    /// This allows you to use iterator inside iteration loop, which is not
    /// posible when using for-in loop.
    ///
    /// See [crate-level docs](./index.html) for examples
    fn foreach<O, F>(&mut self, f: F)
        where
            O: Into<Continue>,
            F: FnMut(Self::Item, &mut Self) -> O;
}

impl<T: Iterator> ForEach for T {
    fn foreach<O, F>(&mut self, mut f: F)
        where
            O: Into<Continue>,
            F: FnMut(Self::Item, &mut Self) -> O,
    {
        loop {
            let item = self.next();
            if let Some(item) = item {
                match f(item, self).into() {
                    Continue::Break => break,
                    _ => (),
                }
            } else {
                break;
            }
        }
    }
}

#[allow(unused_variables)]

fn main() {
    let mut array = 1..=2;
    array.foreach(|i, array| {
        println!("{}", i);
    });
}
