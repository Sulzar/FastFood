using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL_DAL;
using clb_GUI;

namespace GUI
{
    public partial class frmKhachHang_1 : Form
    {
        qlKhachHang_BLL_DAL qlkh = new qlKhachHang_BLL_DAL();
        public frmKhachHang_1()
        {
            InitializeComponent();
           
        }

        public void setHeader()
        {
            dgrvKhachHang.Columns["SDT"].HeaderText = "Số điện thoại";
            dgrvKhachHang.Columns["HoTen"].HeaderText = "Họ và tên";
            dgrvKhachHang.Columns["DiemSo"].HeaderText = "Điểm số";
            
        }

        private void frmKhachHang_Load(object sender, EventArgs e)
        {
            dgrvKhachHang.DataSource = qlkh.loadGridViewKhachHang();
            setHeader();
            usThemKhachHang1.Visible = false;
        }

        private void btnKhachHang_Click(object sender, EventArgs e)
        {
            
            usThemKhachHang1.Visible = true;
        }

        private void btnReset_Click(object sender, EventArgs e)   
        {
            dgrvKhachHang.DataSource = qlkh.loadGridViewKhachHang();
            setHeader();
        }

        private Form activieForm = null;
        private void addFormInPanel(Form form)
        {
            if (activieForm != null)
            {
                activieForm.Close();
            }
            activieForm = form;
            form.TopLevel = false;
            form.Dock = DockStyle.Fill;
            this.pnContainer.Controls.Add(form);
            this.pnContainer.Tag = form;
            form.BringToFront();
            form.Show();
            form.Dock = DockStyle.Fill;
        }

        private void dgrvKhachHang_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (dgrvKhachHang.Rows[e.RowIndex].Cells[e.ColumnIndex].Value != null)
                {
                    dgrvKhachHang.CurrentRow.Selected = true;
                    string sdt = dgrvKhachHang.Rows[e.RowIndex].Cells["SDT"].FormattedValue.ToString();
                    string hoten = dgrvKhachHang.Rows[e.RowIndex].Cells["HoTen"].FormattedValue.ToString();
                    string cmnd = dgrvKhachHang.Rows[e.RowIndex].Cells["CMND"].FormattedValue.ToString();
                    string diem = dgrvKhachHang.Rows[e.RowIndex].Cells["DiemSo"].FormattedValue.ToString();
                    int diemso = 0;
                    if (string.IsNullOrEmpty(diem))
                    {
                        diemso = 0;
                    }
                    else
                    {
                        diemso = int.Parse(diem);
                    }    

                    addFormInPanel(new frmChiTietKhachHang(hoten,sdt,cmnd,diemso));
                  

                }
                
            }
            catch
            {
                return;
            }

        }

        private void dgrvKhachHang_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }
    }
}
