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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void flowLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            new Form2().Show();
            this.Hide();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            new Form3().Show();
            this.Hide();
        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            new Form4().Show();
            this.Hide();
        }

        private void panel5_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id", typeof(int));
            table.Columns.Add("Nom", typeof(string));
            table.Columns.Add("Prenom", typeof(string));
            table.Columns.Add("Type compte", typeof(string));
            table.Columns.Add("Solde", typeof(int));
            table.Columns.Add("Intérés", typeof(string));

            table.Rows.Add(1, "Deschamps", "Didier", "Courrant", 867, "0%");
            table.Rows.Add(2, "Deschamps", "Didier", "Livret A", 15390, "3%");
            table.Rows.Add(3, "Deschamps", "Didier", "Livret Jeune", 1542, "4%");
            table.Rows.Add(4, "Zidane", "Zinedine", "Courant", 1200, "0%");
            table.Rows.Add(5, "Zidane", "Zinedine", "PEL", 8500, "2.5%");
            table.Rows.Add(6, "Henry", "Thierry", "Livret A", 3000, "3%");
            table.Rows.Add(7, "Mbappé", "Kylian", "Livret Jeune", 2500, "4%");
            table.Rows.Add(8, "Pogba", "Paul", "Courant", 600, "0%");
            table.Rows.Add(9, "Griezmann", "Antoine", "Livret A", 4000, "3%");
            table.Rows.Add(10, "Platini", "Michel", "PEL", 12000, "2.5%");
            table.Rows.Add(11, "Lloris", "Hugo", "Livret A", 2200, "3%");
            table.Rows.Add(12, "Giroud", "Olivier", "LEP", 5800, "6%");
            table.Rows.Add(13, "Kanté", "N'Golo", "PEL", 9900, "2.5%");
            table.Rows.Add(14, "Varane", "Raphaël", "Courant", 1000, "0%");
            table.Rows.Add(15, "Thuram", "Marcus", "Livret Jeune", 1500, "4%");
            table.Rows.Add(16, "Ribéry", "Franck", "Livret A", 3400, "3%");
            table.Rows.Add(17, "Evra", "Patrice", "LEP", 4200, "6%");
            table.Rows.Add(18, "Trezeguet", "David", "Courant", 600, "0%");
            table.Rows.Add(19, "Abidal", "Eric", "PEL", 7600, "2.5%");
            table.Rows.Add(20, "Makélélé", "Claude", "Livret A", 2800, "3%");

            dataGridView1.DataSource = table;

            /*
            //Code si la bdd etait relié au backend
       
            // Instanciation de la bdd
            DBInterface dbInterface = new DBInterface();

            // Récupération des comptes
            DataTable accounts = DBInterface.GetAccounts();

            // Entête de présentation
            //Console.WriteLine("ID | Titulaire (Nom, Prénom) | Type de compte | Solde   | Taux");
            //Console.WriteLine("---------------------------------------------------------------");

            // Parcours et affichage des données
            foreach (DataRow row in accounts.Rows)
            {
                // Adaptez le convert en fonction de vos types de données
                int id = Convert.ToInt32(row["Id"]);
                string lastName = row["LastName"].ToString();
                string firstName = row["FirstName"].ToString();
                string accountType = row["AccountType"].ToString();
                decimal balance = Convert.ToDecimal(row["Balance"]);
                string interestRate = row["InterestRate"].ToString();

                Console.WriteLine($"{id} | {lastName} {firstName} | {accountType} | {balance} | {interestRate}");
            }*/
        }
    }
}
