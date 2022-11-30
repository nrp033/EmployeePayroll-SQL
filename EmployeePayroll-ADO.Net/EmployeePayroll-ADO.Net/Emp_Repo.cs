using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeePayroll_ADO.Net
{

    internal class Emp_Repo
    {
        public static string ConnectionString = @"Data Source=ULTRA\SQLEXPRESS;Initial Catalog=Payroll_Services;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;Initial Catalog=Payroll_services;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"; //"Data Source=(localdb)\ProjectsV13;Initial Catalog=payroll_service;Integrated Security=True";
       public static SqlConnection connection = new SqlConnection(ConnectionString);

        public static bool GetAllEmployee()
        {
            try
            {
                Emp_Model model = new Emp_Model();
                using (connection)
                {
                    string query = @"Select * from EmployeePayroll;";
                    SqlCommand cmd = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            model.EmployeeID = Convert.ToInt32(reader["ID"]);//reader.GetInt32(0);
                            model.EmployeeName = Convert.ToString(reader["EmpName"]); //reader.GetString(9);
                            model.Gender = Convert.ToChar(reader["Gender"]);
                            model.PhoneNumber = Convert.ToString(reader["Phone"]);                                                        //model.PhoneNumber = reader.GetString(2);
                            model.Address = Convert.ToString(reader["Address"]);
                            model.Department = Convert.ToString(reader["Department"]);
                            model.StartDate = Convert.ToDateTime(reader["StartDate"]);
                            model.BasicPay = Convert.ToDouble(reader["BasicPay"]);
                            model.Deductions = Convert.ToDouble(reader["Deduction"]);
                            model.TaxablePay = Convert.ToDouble(reader["TaxablePay"]);
                            model.Tax = Convert.ToDouble(reader["Tax"]);
                            model.NetPay = Convert.ToDouble(reader["NetPay"]);

                            //Console.WriteLine(model.EmployeeID + " " + model.EmployeeName + " " + model.Gender + " " + model.PhoneNumber);

                            System.Console.WriteLine(model.EmployeeID+"\t"+ model.EmployeeName+"\t" + model.Gender + "\t" + model.PhoneNumber + "\t"
                                + model.Address + "  " + model.Department + "\t" + model.StartDate 
                                + "  " + model.BasicPay+ "  " + model.Deductions+ "  " + model.TaxablePay+" "+ model.Tax+ "  " + model.NetPay);

                            System.Console.WriteLine("\n");
                        }
                    }
                    else
                    {
                        System.Console.WriteLine("No data found");
                        return false;
                    }
                    return true;
                }
            }
            catch (Exception e)
            {
                System.Console.WriteLine(e.Message);
                return false;
            }
            finally { connection.Close(); }
        }

       


    }
}
