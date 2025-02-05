/*using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_Ma_Banque
{
    internal class get_transactions
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
        /// Méthode qui récupère les transactions dans la base de données
        /// </summary>
        /// <returns>Retourne un DataTable contenant toutes les transactions</returns>
        public DataTable GetTransactions()
        {
            var table = new DataTable();

            // Requête simpliste, adaptez selon vos tables et colonnes
            string query = "SELECT Id, SenderLastName, SenderFirstName, ReceiverLastName, ReceiverFirstName, Amount FROM Transactions";

            // Utilisation d'un bloc using pour gérer correctement la connexion
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