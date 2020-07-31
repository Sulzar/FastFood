using Guna.UI2.WinForms;
using Guna.UI.WinForms;
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
    public partial class frmMain : Form
    {
        GunaAdvenceButton btn, btnHoaDon, btnNhanVien, btnKho, btnSanPham, btnKhachHang_1, btnNhaCungCap,
            btnSoQui, btnChi, btnThu, btnTongQuan, btnLoiNhuan, btnHangHoa, btnDoanhSo;

      

        public frmMain()
        {
            InitializeComponent();
            btnFullMenu.Visible = false; 
        }

        private void btnCollapseMenu_Click(object sender, EventArgs e)
        {
            pnLeft.Width = 45;
            btnFullMenu.Visible = true;
            btnCollapseMenu.Visible = false;
            //btnLogo.Visible = false;
            btnHidePnTaiKhoan.Visible = false;
        }
        private void btnFullMenu_Click(object sender, EventArgs e)
        {
            pnLeft.Width = 250;
            btnCollapseMenu.Visible = true;
            btnFullMenu.Visible = false;
           // btnLogo.Visible = true;
            btnHidePnTaiKhoan.Visible = true;
        }

        private void btnHidePnTaiKhoan_Click(object sender, EventArgs e)
        {
            if (pnSubTaiKhoan.Visible == false)
            {
                pnSubTaiKhoan.Visible = true;
            }
            else
            {
                pnSubTaiKhoan.Visible = false;
            }
           
        }

        private void picTaiKhoan_Click(object sender, EventArgs e)
        {

            if (pnSubTaiKhoan.Visible == false)
            {
                pnSubTaiKhoan.Visible = true;
            }
            else
            {
                pnSubTaiKhoan.Visible = false;
            }
        }

        public GunaAdvenceButton addButton(string text)
        {
            btn = new GunaAdvenceButton()
            {
                AnimationHoverSpeed = 0.07F,
                AnimationSpeed = 0.03F,
                BackColor = Color.White,
                BaseColor = Color.White,
                BorderColor = Color.White,
                CheckedBaseColor = Color.White,
                CheckedBorderColor = Color.White,
                CheckedForeColor = Color.White,
                CheckedImage = null,
                CheckedLineColor = Color.FromArgb(249, 130, 68),
                DialogResult = DialogResult.None,
                FocusedColor = Color.Empty,
                Font = new Font("Segoe UI", 11F),
                ForeColor = Color.FromArgb(64,64,64),
                Image = null,
                ImageSize = new Size(20, 20),
                LineBottom = 3,
                LineColor = Color.FromArgb(165, 38, 0),
                Location = new Point(428, 50),
                OnHoverBaseColor = Color.Tomato,
                OnHoverBorderColor = Color.Empty,
                OnHoverForeColor = Color.FromArgb(255,255,255),
                OnHoverImage = null,
                OnHoverLineColor = Color.FromArgb(249, 130, 68),
                OnPressedColor = Color.Black,
                Size = new Size(200, 40),
                TabIndex = 11,
                Text = text,
                TextAlign = HorizontalAlignment.Center,
                Dock = DockStyle.Left

        };
            return btn;
        }






        private void btnPOS_Click(object sender, EventArgs e)
        {

        }

        private void btnQuanLy_Click(object sender, EventArgs e)
        {
               pnTabHoz.Controls.Clear();

               btnHoaDon =  addButton("Hóa đơn");
               btnHoaDon.Click += BtnHoaDon_Click;

               btnNhanVien = addButton("Nhân viên");
               btnNhanVien.Click += BtnNhanVien_Click;

               btnKho = addButton("Kho - Nguyên liệu");
               btnKho.Click += BtnKho_Click;

               btnSanPham = addButton("Sản phẩm");
               btnSanPham.Click += BtnSanPham_Click;

               pnTabHoz.Controls.Add(btnHoaDon);
               pnTabHoz.Controls.Add(btnNhanVien);
               pnTabHoz.Controls.Add(btnKho);
               pnTabHoz.Controls.Add(btnSanPham);

        }

       

        private void btnKhachHang_Click(object sender, EventArgs e)
        {
            pnTabHoz.Controls.Clear();

            btnKhachHang_1 = addButton("Khách hàng");
            btnKhachHang_1.Click += BtnKhachHang_1_Click;

            btnNhaCungCap = addButton("Nhà cung cấp");
            btnNhaCungCap.Click += BtnNhaCungCap_Click;

            pnTabHoz.Controls.Add(btnNhaCungCap);
            pnTabHoz.Controls.Add(btnKhachHang_1);
            
        }

      

        private void btnTienBac_Click(object sender, EventArgs e)
        {
            pnTabHoz.Controls.Clear();
            btnSoQui = addButton("Sổ quĩ");
            btnThu = addButton("Thu");
            btnChi = addButton("Chi");
            btnTongQuan = addButton("Tổng quan");
            pnTabHoz.Controls.Add(btnSoQui);
            pnTabHoz.Controls.Add(btnThu);
            pnTabHoz.Controls.Add(btnChi);
            pnTabHoz.Controls.Add(btnTongQuan);
        }
        private void btnBaoCao_Click(object sender, EventArgs e)
        {
            pnTabHoz.Controls.Clear();
            btnLoiNhuan = addButton("Lợi nhuận");
            btnHangHoa = addButton("Hàng hóa");
            btnDoanhSo = addButton("Doanh số");
            pnTabHoz.Controls.Add(btnLoiNhuan);
            pnTabHoz.Controls.Add(btnHangHoa);
            pnTabHoz.Controls.Add(btnDoanhSo);
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
        }

        private void BtnHoaDon_Click(object sender, EventArgs e)
        {
            addFormInPanel(new frmHoaDon());
        }

        private void BtnNhanVien_Click(object sender, EventArgs e)
        {
            addFormInPanel(new frmNhanVien());
        }

        private void BtnKho_Click(object sender, EventArgs e)
        {
            addFormInPanel(new frmKho());
        }

        private void BtnSanPham_Click(object sender, EventArgs e)
        {
            addFormInPanel(new frmSanPham());
        }

        private void BtnNhaCungCap_Click(object sender, EventArgs e)
        {
            addFormInPanel(new frmNhaCungCap());
        }

        private void BtnKhachHang_1_Click(object sender, EventArgs e)
        {
            addFormInPanel(new frmKhachHang_1());
        }




    }
}
