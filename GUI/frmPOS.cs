using Guna.UI.WinForms;
using System;
using System.Windows.Forms;
using BLL_DAL;
using System.Collections.Generic;
using System.Drawing;
using clb_GUI;


namespace GUI
{
    public partial class frmPOS : Form
    {
        #region Properties

        SanPham_BLL_DAL sp_bll = new SanPham_BLL_DAL();
        qlKhachHang_BLL_DAL kh_bll = new qlKhachHang_BLL_DAL();
        List<QL_ChiTietHoaDon> lstChiTiet;
        HoaDon_BLL_DLL hd_bll = new HoaDon_BLL_DLL();
        bool checkTienMat;
        int tongtienHd;
        QL_KHACHHANG kh_hientai;

        #endregion
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

            Guna.UI.Lib.ScrollBar.PanelScrollHelper flowpanel =
                new Guna.UI.Lib.ScrollBar.PanelScrollHelper(pnHienThiSanPham, gunaVScrollBar1, true);

            hienthiSanPham(sp_bll.getALLSP());
            resetPNThanhToan();
            loadLoaiNguyenLieu();
            btnThanhToan.Enabled = false;
            btnTienMat.BaseColor = Color.Purple;
            btnTienMat.ForeColor = Color.White;
            checkTienMat = true;
            btnThe.BaseColor = Color.White;
            btnThe.ForeColor = Color.Gray;
            tongtienHd = 0;

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

       

        private void btnBackToManager_Click(object sender, EventArgs e)
        {
            frmMain frm = new frmMain();
            frm.WindowState = FormWindowState.Maximized;
            frm.Show();
            this.Close();
        }



        //Hien thi loai nguyen lieu
        public void loadLoaiNguyenLieu()
        {
            List<QL_LoaiNguyenLieu> lstLoai = sp_bll.getALLCateNL();
            int top = 10;

            for (int i = 0; i < lstLoai.Count; i++)
            {
                if (lstLoai[i].Hinh == null)
                {
                    continue;
                }
                try
                {
                    GunaAdvenceTileButton btnLoaiNguyenLieu = new GunaAdvenceTileButton()
                    {
                        Location = new Point(7, top),
                        Text = lstLoai[i].TenLoai,
                        Width = pnLoaiNguyenLieu.Width,
                        Size = new Size(59, 50),
                        Image = Image.FromFile("../../img/icon_loai/" + lstLoai[i].Hinh),
                        ImageSize = new Size(25, 25),
                        BaseColor = Color.Transparent,
                        OnHoverBaseColor = Color.Transparent,
                        BackColor = Color.Transparent,
                        CheckedBaseColor = Color.Transparent,
                        Animated = true,
                        Tag = lstLoai[i].MaLoaiNL,
                        Font = new Font("Microsoft Sans Serif", 9, FontStyle.Regular)
                    };
                    top += btnLoaiNguyenLieu.Height + 5;
                    btnLoaiNguyenLieu.Click += BtnLoaiNguyenLieu_Click; ;

                    pnLoaiNguyenLieu.Controls.Add(btnLoaiNguyenLieu);
                }
                catch (Exception)
                {
                    continue;
                    throw;
                }

            }
        }

        private void BtnLoaiNguyenLieu_Click(object sender, EventArgs e)
        {
            GunaAdvenceTileButton btn = (GunaAdvenceTileButton)sender;
            loadSPTheoLoaiNL(btn.Tag.ToString());
        }

        private void loadSPTheoLoaiNL(string maLoaiNL)
        {
            List<QL_SanPham> lstSP = sp_bll.laySPTheoLoaiNL(maLoaiNL);

            hienthiSanPham(lstSP);
        }

        private void hienthiSanPham(List<QL_SanPham> lstSP)
        {
            pnHienThiSanPham.Controls.Clear();
            foreach (QL_SanPham item in lstSP)
            {
                string path;
                usSanPham itemsp = new usSanPham();

                //itemsp.btnchon.Visible = false;
                itemsp.pnLine.Visible = false;
               
                if (item.Hinh == null || item.Hinh == string.Empty)
                {
                    path = "../../img/img_sanpham/" + "sandwich.jpg";
                }
                else
                {
                    path = "../../img/img_sanpham/" + item.Hinh;
                }

                itemsp.setValueSP((int)item.Gia, path, item.TenSanPham);
                itemsp.setEventForALL();
                itemsp.pictureBox1.Tag = item.MaSP + "," + (int)item.Gia;
                itemsp.pictureBox1.Click += itemsp_picturebox;
                pnHienThiSanPham.Controls.Add(itemsp);
            }

        }

        void itemsp_picturebox(object sender, EventArgs e)
        {
            PictureBox pc = (PictureBox)sender;
            if (lstChiTiet == null)
            {
                MessageBox.Show("Chưa tạo hóa đơn");
                return;
            }
            string[] mavagia = pc.Tag.ToString().Split(',');

            QL_ChiTietHoaDon cthd = new QL_ChiTietHoaDon();
            cthd.MaHD = " ";

            cthd.MaSP = mavagia[0];
            cthd.Soluong = 1;
            cthd.DonGia = Convert.ToInt32(mavagia[1]);

            if (!checkHD(mavagia[0]))
            {
                MessageBox.Show("Đã chọn sản phẩm này !");
                return;
            }

            lstChiTiet.Add(cthd);

            usChiTietHD usChiTiet = new usChiTietHD();
            usChiTiet.setValue(mavagia[0]);
            usChiTiet.Tag = mavagia[0];
            usChiTiet.btnTangGiam.Tag = mavagia[0];
            usChiTiet.btnHuy.Tag = mavagia[0];

            pnChiTietHD.Controls.Add(usChiTiet);
            usChiTiet.btnTangGiam.Click += BtnTangGiam_Click; ;
            usChiTiet.btnHuy.Click += BtnHuy_Click; ;
            capnhapTongTien();
        }

        private void capnhapTongTien()
        {
            if (lstChiTiet.Count == 0)
            {
                return;
            }
            int tong = 0;
            foreach (usChiTietHD item in pnChiTietHD.Controls)
            {
                tong += item.TongTien;
            }
            lbTongTien.Text = tong.ToString();

            int thanhtien = int.Parse(lbTongTien.Text) - int.Parse(lbGiamGia.Text);
            lbThanhTien.Text = thanhtien.ToString();

        }

        private void BtnHuy_Click(object sender, EventArgs e)
        {
            GunaAdvenceTileButton nb = (GunaAdvenceTileButton)sender;
            for (int i = 0; i < pnChiTietHD.Controls.Count; i++)
            {
                if (pnChiTietHD.Controls[i].Tag != null && pnChiTietHD.Controls[i].Tag.ToString() == nb.Tag.ToString())
                {
                    pnChiTietHD.Controls.Remove(pnChiTietHD.Controls[i]);
                    lstChiTiet.RemoveAt(i);
                }
                else
                {
                    continue;
                }
            }
            capnhapTongTien();
        }

        private void BtnTangGiam_Click(object sender, EventArgs e)
        {
            GunaNumeric nb = (GunaNumeric)sender;
            foreach (Control item in pnChiTietHD.Controls)
            {
                if (item.Tag != null && item.Tag.ToString() == nb.Tag.ToString())
                {
                    usChiTietHD usChiTiet = (usChiTietHD)item;
                    usChiTiet.capnhapTongTien((int)nb.Value);
                }
                else
                {
                    continue;
                }
            }
            capnhapTongTien();
        }

        private bool checkHD(string maSP)
        {
            if (lstChiTiet.Count == 0)
            {
                return true;
            }
            foreach (Control control in pnChiTietHD.Controls)
            {

                if (control.Tag.ToString() == maSP)
                {
                    return false;
                }
            }
            return true;
        }
        public string taoMaHD()
        {
            string date = DateTime.Now.Date.ToShortDateString();
            int stt = hd_bll.demHD();
            Random rd = new Random();
            return "HD" + stt + date + rd.Next(0, 100);
        }

        private void btnTatCa_Click(object sender, EventArgs e)
        {
            List<QL_SanPham> lst = sp_bll.getALLSP();
            hienthiSanPham(lst);
        }

        private void btnThucAn_Click(object sender, EventArgs e)
        {
            List<QL_SanPham> lst = sp_bll.getALLByLoaiList("LOAISP01");
            hienthiSanPham(lst);
        }

        private void btnDoUong_Click(object sender, EventArgs e)
        {
            List<QL_SanPham> lst = sp_bll.getALLByLoaiList("LOAISP02");
            hienthiSanPham(lst);
        }

        private void btnThemHD_Click(object sender, EventArgs e)
        {
            if (btnThanhToan.Enabled == false)
            {
                btnThanhToan.Enabled = true;
                btnThemHD.FillColor = Color.Yellow;
                btnThemHD.FillColor2 = Color.SkyBlue;
                resetPNThanhToan();
                txtKhachHang.Enabled = true;
                btnSeachKH.Enabled = true;
                btnThemHD.Text = "-";

                lstChiTiet = new List<QL_ChiTietHoaDon>();


            }
            else
            {
                btnThanhToan.Enabled = false;
                btnThemHD.FillColor = Color.Violet;
                btnThemHD.FillColor2 = Color.SkyBlue;
                btnThemHD.Text = "+";
                resetPNThanhToan();
                pnChiTietHD.Controls.Clear();
                lstChiTiet = null;
            }
        }
        public bool checkTienDua()
        {
            if (txtTienDua.Text == string.Empty)
            {
                return false;
            }
            int tiendua = Convert.ToInt32(txtTienDua.Text);
            int tongtien = Convert.ToInt32(lbTongTien.Text);
            return tiendua >= tongtien ? true : false;
        }

        private void btnThanhToan_Click(object sender, EventArgs e)
        {
            if (lstChiTiet == null || lstChiTiet.Count == 0)
            {
                MessageBox.Show("Chưa có sản phẩm nào");
                return;
            }
            if (!checkTienDua())
            {
                MessageBox.Show("Không hợp lệ");
                return;
            }
            else
            {
                DialogResult rs = MessageBox.Show("Lưu ý", "Xác nhận thanh toán", MessageBoxButtons.YesNo);
                if (rs == DialogResult.No)
                {
                    return;
                }

                string phuongthuc = checkTienMat ? "Tiền Mặt" : "Thẻ";
                int tongtien = Convert.ToInt32(lbTongTien.Text);
                //double TongTien = ckDiem.Checked ? tongtien : tongtien;
                int soLuong = 0;

               
                

                bool check = hd_bll.themHoaDon(lstChiTiet, "ND01", "KH01", phuongthuc, txtTienDua.Text, lbTienDu.Text, Convert.ToInt32(tongtien), soLuong);

                if (check)
                {
                    MessageBox.Show("Thanh toán thành công !");

                }
                else
                {
                    MessageBox.Show("Thanh toán thất bại !");
                }

            }
        }

        public void resetPNThanhToan()
        {
            lbDiem.Text = "0";
            lbTongTien.Text = "0";
            lbTienDu.Text = "0";
            lbThanhTien.Text = "0";
            txtTienDua.Text = "0";
            checkDungDiem.Enabled = false;
            txtKhachHang.Enabled = false;
            btnSeachKH.Enabled = false;
        }

        private void txtTienKhachDua_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (txtTienDua.Text == string.Empty)
                {
                    lbTienDu.Text = "0";
                    return;
                }

                int val = Convert.ToInt32(txtTienDua.Text);
                updateTienThua_TienThieu(val, Convert.ToInt32(lbTongTien.Text));
            }
            catch
            {
                MessageBox.Show("Vượt giới hạn của kiểu dữ liệu");
            }
        }

        public void updateTienThua_TienThieu(int val, int tong)
        {
            ChucNang cn = new ChucNang();
            if (val > tong)
            {

                lbTienDu.Text = (val - tong).ToString();
                lbTienDu.ForeColor = Color.Blue;
                lbTienDuHoacThieu.Text = "Tiền dư:";
            }
            else if (val < tong)
            {


                lbTienDu.Text = (tong - val).ToString();
                lbTienDu.ForeColor = Color.Red;
                lbTienDuHoacThieu.Text = "Tiền thiếu:";
            }
            else
            {
                lbTienDu.Text = "0";
            }
        }

        private void btnThe_Click(object sender, EventArgs e)
        {
            btnThe.BaseColor = Color.Purple;
            btnThe.ForeColor = Color.White;
            checkTienMat = false;
            btnTienMat.BaseColor = Color.White;
            btnTienMat.ForeColor = Color.Gray;
        }
        private void btnTienMat_Click(object sender, EventArgs e)
        {
            lbTienKhachDua.Visible = true;
            txtTienDua.Visible = true;
            lbTienDu.Visible = true;
            lbTienDuHoacThieu.Visible = true;

            btnTienMat.BaseColor = Color.Purple;
            btnTienMat.ForeColor = Color.White;
            checkTienMat = true;
            btnThe.BaseColor = Color.White;
            btnThe.ForeColor = Color.Gray;
        }

        private void txtSearchSP_TextChanged(object sender, EventArgs e)
        {
            List<QL_SanPham> lstSP = sp_bll.searchSP(pnHienThiSanPham.Text);


            hienthiSanPham(lstSP);
        }

        private void btnSeachKH_Click(object sender, EventArgs e)
        {
            if (txtKhachHang.Enabled == false)
            {
                txtKhachHang.Text = "";
                txtKhachHang.Enabled = true;
                lbDiem.Text = "0";
                checkDungDiem.Enabled = false;
                return;
            }
            if (txtKhachHang.Text == string.Empty)
            {
                MessageBox.Show("Chưa nhập mã số khách hàng");
                return;
            }
            else
            {

                string makh = txtKhachHang.Text;
                QL_KHACHHANG kh = kh_bll.loadGridViewTimKiemPOSKhachHang(makh);
                kh_hientai = kh;
                if (kh == null)
                {
                    MessageBox.Show("Khách Hàng này không tồn tại");
                    return;
                }
                txtKhachHang.Text = kh.HoTen;
                txtKhachHang.Enabled = false;
                if (kh.DiemSo == 0 || kh.DiemSo == null)
                {
                    lbDiem.Text = "0";
                    checkDungDiem.Enabled = false;
                    return;
                }
                checkDungDiem.Enabled = true;
                lbDiem.Text = (int)kh.DiemSo + "";
            }
        }

        private void btnThemKhachHang_Click(object sender, EventArgs e)
        {
            usThemKhachHang us = new usThemKhachHang();
            Form window = new Form
            {
                TopLevel = true,
                FormBorderStyle = FormBorderStyle.FixedDialog, //Disables user resizing
                MaximizeBox = false,
                MinimizeBox = false,
                ClientSize = us.Size //size the form to fit the content
            };
            
            window.Controls.Add(us);
            us.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            window.StartPosition = FormStartPosition.CenterScreen;
           
            if(us.tag == 0)
            {
                window.ShowDialog();
            }
            else
            {
                
                window.Close();
                txtKhachHang.Text = us.ma;
            }
           
        }
    }
}
