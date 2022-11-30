namespace EmployeePayroll_ADO.Net
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");
            Emp_Repo.GetAllEmployee();
            Console.ReadKey();

        }
    }
}