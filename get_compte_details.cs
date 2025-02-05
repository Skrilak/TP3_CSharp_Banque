/*using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TP_Ma_Banque
{
    internal class get_compte_details
    {
    }

namespace MonApplication
    {
        /// <summary>
        /// Objet métier pour représenter le résultat : solde, dépenses, recettes
        /// </summary>
        public class CompteDetails
        {
            public decimal Solde { get; set; }
            public decimal Depenses { get; set; }
            public decimal Recettes { get; set; }
        }

        /// <summary>
        /// Classe qui récupère les détails d’un compte (solde, dépenses, recettes)
        /// depuis la base de données.
        /// </summary>
        public class GetCompteDetails
        {
            private readonly string _connectionString;

            public GetCompteDetails(string connectionString)
            {
                _connectionString = connectionString;
            }

            /// <summary>
            /// Récupère les détails (Solde, Dépenses, Recettes) pour un compte donné
            /// </summary>
            /// <param name="compteId">Identifiant du compte à interroger</param>
            /// <returns>Un objet CompteDetails avec les valeurs trouvées</returns>
            public CompteDetails Execute(int compteId)
            {
                var details = new CompteDetails();

                // Requête SQL : on suppose que la table 'Comptes' possède la colonne 'Solde'.
                // La table 'Transactions' référence le compte émetteur et le compte bénéficiaire.
                string query = @"
                SELECT 
                    c.Solde AS Solde,
                    Depenses = ISNULL(SUM(CASE WHEN t.SenderCompteId = @compteId THEN t.Amount END), 0),
                    Recettes = ISNULL(SUM(CASE WHEN t.ReceiverCompteId = @compteId THEN t.Amount END), 0)
                FROM Comptes c
                LEFT JOIN Transactions t 
                    ON c.Id = t.SenderCompteId 
                    OR c.Id = t.ReceiverCompteId
                WHERE c.Id = @compteId
                GROUP BY c.Solde;
            ";

                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Paramètre pour éviter toute injection et filtrer sur le compte concerné
                        cmd.Parameters.AddWithValue("@compteId", compteId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            // S’il y a un résultat, on lit la première ligne
                            if (reader.Read())
                            {
                                // Récupération des valeurs par nom de colonne
                                details.Solde = reader.GetDecimal(reader.GetOrdinal("Solde"));
                                details.Depenses = reader.GetDecimal(reader.GetOrdinal("Depenses"));
                                details.Recettes = reader.GetDecimal(reader.GetOrdinal("Recettes"));
                            }
                        }
                    }
                }

                return details;
            }
        }
    }

}
*/