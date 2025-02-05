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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textUserName.Text == "admin" && textUserPassword.Text == "admin")
            {
                new Form2().Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Mod de passe ou indentifiant incorrecte.");
                textUserName.Clear();
                textUserPassword.Clear();
                textUserName.Focus();
            }
            /*
            //Code si la bdd etait relié au backend

            string username = textUserName.Text;
            string password = textUserPassword.Text;

            // Instanciation de la bdd
            DBInterface dbInterface = new DBInterface();

            // Validation
            bool isValid = dbInterface.CheckLogin(username, password);

            if (isValid)
            {
                Console.WriteLine("Authentification réussie !");
                new Form2().Show();
                this.Hide();
            }
            else
            {
                Console.WriteLine("Échec d’authentification : identifiants invalides.");
                MessageBox.Show("Mod de passe ou indentifiant incorrecte.");
                textUserName.Clear();
                textUserPassword.Clear();
                textUserName.Focus();
            }*/
        }

        private void label2_Click(object sender, EventArgs e)
        {
            textUserName.Clear();
            textUserPassword.Clear();
            textUserName.Focus();
        }

        private void label3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
