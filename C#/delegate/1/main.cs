using System;

public class Test
{
    public static void Main()
    {
        Test test = new Test();
        test.Say( content => {
            Console.WriteLine(content);
            return "Hello C#!";
        });
    }
    
    void Say(Reply reply) {
        Console.WriteLine(reply("Hello World!"));
    }
    
    delegate String Reply(String r);
}
