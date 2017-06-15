using System;
 
public class M
{
    public static void Main()
    {
        M m = new M();
        m.Say( content => {
            Console.WriteLine(content);
            return "Hello C#!";
        });
    }
    
    void Say(Reply reply) {
        Console.WriteLine(reply("Hello World!"));
    }
    
    delegate String Reply(String s);
}
