using System;
 
public class M
{
    public static void Main()
    {
        M m = new M();
        m.Say( end => {
            Console.WriteLine("Hello C#!");
            end("^_^");
        });
    }
    
    void Say(Reply reply) {
        Console.WriteLine("Hello World!");
        reply( content => {
            Console.WriteLine(content);
        });
    }
    
    delegate void Reply(End e);
    delegate void End(String s);
}
