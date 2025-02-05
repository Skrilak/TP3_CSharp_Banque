/*
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_Ma_Banque
{
    internal class get_comptes
    {
    }

public class DatabaseHelper
    {
        private readonly string _connectionString;

        public DatabaseHelper(string connectionString)
        {
            _connectionString = connectionString;
        }

        /// <summary>
        /// Méthode qui récupère les comptes dans la base de données.
        /// </summary>
        /// <returns>Retourne un DataTable contenant la liste des comptes.</returns>
        public DataTable GetAccounts()
        {
            var table = new DataTable();

            // Requête simplifiée, adaptez la selon votre schéma
            string query = @"
            SELECT 
                Id, 
                LastName, 
                FirstName, 
                AccountType, 
                Balance, 
                InterestRate
            FROM Accounts";

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(table);
                    }
                }
            }

            return table;
        }
    }

}
*/