using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TP_Ma_Banque
{
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            new Form3().Show();
            this.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            new Form2().Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            new Form4().Show();
            this.Hide();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Form4_Load(object sender, EventArgs e)
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id Transaction", typeof(int));
            table.Columns.Add("Nom Envoyeur", typeof(string));
            table.Columns.Add("Prenom Envoyeur", typeof(string));
            table.Columns.Add("Nom Receuveur", typeof(string));
            table.Columns.Add("Prenom Receuveur", typeof(string));
            table.Columns.Add("Montant", typeof(int));

            table.Rows.Add(1, "Deschamps", "Didier", "Becker", "Hugo", 579);
            table.Rows.Add(2, "Deschamps", "Didier", "Civil", "François", 4796);
            table.Rows.Add(3, "Lottin", "Pierre", "Deschamps", "Didier", 3975);
            table.Rows.Add(4, "Deschamps", "Didier", "Guetta", "David", 754);
            table.Rows.Add(5, "Labbé", "Guillaume", "Deschamps", "Didier", 564);
            table.Rows.Add(6, "Mandi", "Arienne", "Deschamps", "Didier", 2349);
            table.Rows.Add(7, "Giroud", "Olivier", "Mbappé", "Kylian", 1320);
            table.Rows.Add(8, "Zidane", "Zinedine", "Henry", "Thierry", 4980);
            table.Rows.Add(9, "Pogba", "Paul", "Platini", "Michel", 3100);
            table.Rows.Add(10, "Griezmann", "Antoine", "Zidane", "Zinedine", 2250);
            table.Rows.Add(11, "Evra", "Patrice", "Barthez", "Fabien", 975);
            table.Rows.Add(12, "Desailly", "Marcel", "Kanté", "N'Golo", 1600);
            table.Rows.Add(13, "Cantona", "Eric", "Papin", "Jean-Pierre", 2200);
            table.Rows.Add(14, "Benzema", "Karim", "Rami", "Adil", 3550);
            table.Rows.Add(15, "Djorkaeff", "Youri", "Petit", "Emmanuel", 990);
            table.Rows.Add(16, "Sagna", "Bacary", "Zidane", "Zinedine", 780);
            table.Rows.Add(17, "Mavuba", "Rio", "Rothen", "Jérôme", 1250);
            table.Rows.Add(18, "Gallas", "William", "Kanté", "N'Golo", 2100);
            table.Rows.Add(19, "Wiltord", "Sylvain", "Dugarry", "Christophe", 675);
            table.Rows.Add(20, "Pirès", "Robert", "Thuram", "Lilian", 3040);

            dataGridView1.DataSource = table;

            /*
            // Créez l’instance de votre helper avec votre chaîne de connexion
            string connectionString = "Server=MON_SERVEUR;Database=MA_BDD;User Id=MON_USER;Password=MON_PASSWORD;";
            DatabaseHelper dbHelper = new DatabaseHelper(connectionString);

            // Récupération du DataTable
            DataTable transactions = dbHelper.GetTransactions();

            // Affichage des données
            Console.WriteLine("ID | Émetteur (Nom, Prénom) | Bénéficiaire (Nom, Prénom) | Montant");
            Console.WriteLine("---------------------------------------------------------------------");

            foreach (DataRow row in transactions.Rows)
            {
                // Exemple d’affichage, adaptez si la structure de vos données diffère
                int id = Convert.ToInt32(row["Id"]);
                string senderLastName = row["SenderLastName"].ToString();
                string senderFirstName = row["SenderFirstName"].ToString();
                string receiverLastName = row["ReceiverLastName"].ToString();
                string receiverFirstName = row["ReceiverFirstName"].ToString();
                decimal amount = Convert.ToDecimal(row["Amount"]);

                Console.WriteLine($"{id} | {senderLastName} {senderFirstName} -> {receiverLastName} {receiverFirstName} | {amount}");
            }*/
        }
    }
}
