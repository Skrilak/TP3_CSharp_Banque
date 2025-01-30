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

            dataGridView1.DataSource = table;
        }
    }
}
