using Guna.UI.WinForms;
using System;
using System.Windows.Forms;

namespace GUI
{
    public partial class frmPOS : Form
    {

        public frmPOS()
        {
            InitializeComponent();
            btnBackToManager.Visible = false;
        }


        public frmPOS(bool show)
        {
            InitializeComponent();
            btnBackToManager.Visible = show;
        }


        private void frmPOS_Load(object sender, EventArgs e)
        {
            
            Guna.UI.Lib.ScrollBar.PanelScrollHelper flowpanel = new Guna.UI.Lib.ScrollBar.PanelScrollHelper(flowLayoutPanel1,gunaVScrollBar1,true);
        }
       

        public void choiceMenu(GunaGradientButton btn, GunaLinePanel pn_line)
        {
            if (btn.Visible == false)
            {
                btn.Visible = true;
                pn_line.Visible = true;
            }
            else
            {
                btn.Visible = false;
                pn_line.Visible = false;
            }
        }

        private void pnPosSanPham_Click(object sender, EventArgs e)
        {
            choiceMenu(btn1, gunaLinePanel1_vai);
        }

        private void gunaLinePanel1_Click(object sender, EventArgs e)
        {
            choiceMenu(btn1, gunaLinePanel1_vai);
        }

        private void btnTienMat_Click(object sender, EventArgs e)
        {
            lbTienKhachDua.Visible = true;
            txtTienKhachDua.Visible = true;
            lbTienDu.Visible = true;
            lbTienDu_1.Visible = true;

        }

        private void btnBackToManager_Click(object sender, EventArgs e)
        {
            frmMain frm = new frmMain();
            frm.WindowState = FormWindowState.Maximized;
            frm.Show();
            this.Close();
        }
    }
}
