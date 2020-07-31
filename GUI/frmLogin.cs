using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    public partial class frmLogin : Form
    {
       
        public frmLogin()
        {
            InitializeComponent();
            txtPassword.PasswordChar = '\u2022';
            CenterToScreen();
        }

      
        private void btnLogIn_Click(object sender, EventArgs e)
        {
            if(txtUsername.TextLength <= 0)
            {
                MessageBox.Show(lbUsername.Text + " không được bỏ trống!");
                txtUsername.Focus();
            }
            else if (txtPassword.TextLength <= 0)
            {
                MessageBox.Show(lbPass.Text + " không được bỏ trống!");
                txtPassword.Focus();
            }
            //xét đk tài khoản
            else if(txtUsername.Text != "abc" && txtPassword.Text != "123")
            {
                MessageBox.Show(lbUsername.Text +" hoặc "+lbPass.Text+" không chính xác");
                txtPassword.Clear();
                txtUsername.Clear();
                txtUsername.Focus();
                
            } 
            else 
            {
                DialogResult result;
                result = MessageBox.Show("Đăng nhập thành công", "Thông báo",
                    MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1);
                if (result == DialogResult.OK)
                {
                    this.Visible = false;
                    frmMain frm = new frmMain();
                    frm.Show();

                }
            }
           
        }

        private void chkShowHidePass_CheckedChanged(object sender, EventArgs e)
        {
            if (chkShowHidePass.Checked)
            {
                chkShowHidePass.Text = "Ẩn mật khẩu";
                txtPassword.PasswordChar = (char)0;
            }
            else
            {
                chkShowHidePass.Text = "Hiện mật khẩu";
                txtPassword.PasswordChar = '\u2022';
            }
        }
    }
}
