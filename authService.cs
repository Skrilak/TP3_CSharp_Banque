/*using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_Ma_Banque
{
    internal class authService
    {
    }

namespace MonApplication
    {
        public class AuthService
        {
            private readonly string _connectionString;

            public AuthService(string connectionString)
            {
                _connectionString = connectionString;
            }

            /// <summary>
            /// Vérifie si le couple (username, password) existe dans la base de données.
            /// </summary>
            /// <param name="username">Nom d’utilisateur</param>
            /// <param name="password">Mot de passe (en clair, à des fins d'exemple seulement)</param>
            /// <returns>true si les identifiants sont valides, false sinon</returns>
            public bool ValidateUser(string username, string password)
            {
                // Requête SQL simplifiée
                string query = @"
                SELECT COUNT(*)
                FROM Users
                WHERE Username = @username
                  AND Password = @password
            ";

                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Paramètres pour éviter les injections SQL
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);

                        // ExecuteScalar retourne la première colonne de la première ligne du résultat
                        int count = (int)cmd.ExecuteScalar();

                        // Si count > 0, ça veut dire qu’il y a au moins un enregistrement
                        // correspondant au couple (username, password)
                        return (count > 0);
                    }
                }
            }
        }
    }

}
*/