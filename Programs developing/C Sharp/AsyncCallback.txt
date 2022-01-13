--------------------------------------------------------------------------------------------------------------
Control.BeginInvoke (Delegate, Object[])
https://msdn.microsoft.com/ru-ru/library/a06c0dc2(v=vs.110).aspx
--------------------------------------------------------------------------------------------------------------
foreach (var item in ribbonControl.Items)
{
    if (item is BarButtonItem)
    {
        var barButtonItem = item as BarButtonItem;
        if (barButtonItem.Name == barButtonItemRefresh.Name)
        {
            //
        }
    }
}
--------------------------------------------------------------------------------------------------------------
IAsyncResult and methods BeginInvoke/EndInvoke
https://metanit.com/sharp/tutorial/13.2.php
--------------------------------------------------------------------------------------------------------------
using System;
using System.Threading;
namespace AsyncApp
{
    public delegate int DisplayHandler(int k);
 
    class Program
    {
        static void Main(string[] args)
        {
            DisplayHandler handler = new DisplayHandler(Display);
            IAsyncResult resultObj = handler.BeginInvoke(10, new AsyncCallback(AsyncCompleted), "Asynchronous calls");
            Console.WriteLine("Main method continues to work");
            int res = handler.EndInvoke(resultObj);
            Console.WriteLine("Result: {0}", res);
            Console.ReadLine();
        }
 
        static int Display(int k)
        {
            Console.WriteLine("The Display method begins...");
 
            int result = 0;
            for (int i = 1; i < 10; i++)
            {
                result += k * i;
            }
            Thread.Sleep(3000);
            Console.WriteLine("Display method completes.");
           return result;
        }
 
        static void AsyncCompleted(IAsyncResult resObj)
        {
            string mes = (string)resObj.AsyncState;
            Console.WriteLine(mes);
            Console.WriteLine("Asynchronous delegate completed.");
        }
    }
}