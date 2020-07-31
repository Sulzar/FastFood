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

namespace GUI
{
    public partial class frmChiTietKhachHang : Form
    {
        qlKhachHang_BLL_DAL qlkh = new qlKhachHang_BLL_DAL();
       
        public frmChiTietKhachHang()
        {
            InitializeComponent();
        }

        public frmChiTietKhachHang(string hoten, string sdt, string cmnd, int diem)
        {
            InitializeComponent();
            txtTenKhachHang.Text =hoten;
            txtDienThoai.Text = sdt;
            txtCMND.Text = cmnd;
            txtDiemSo.Text = diem.ToString();
            dgrvHoaDon_KhachHang.DataSource = qlkh.loadDonHangTheoKhachHang(sdt);
            setHeader();
            drgvSanPham_KH.DataSource = qlkh.loadSanPham(sdt);
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();
            
        }

        public void setEnable(bool b)
        {
            txtDiemSo.Enabled = b;
            txtDienThoai.Enabled = b;
            txtCMND.Enabled = b;
            txtTenKhachHang.Enabled = b;
            
        }

        public void setHeader()
        {
            dgrvHoaDon_KhachHang.Columns["MaHD"].HeaderText = "Mã hóa đơn";
            dgrvHoaDon_KhachHang.Columns["NgayLap"].HeaderText = "Ngày lập";
            dgrvHoaDon_KhachHang.Columns["PhuongThuc"].HeaderText = "Phương thức";
            dgrvHoaDon_KhachHang.Columns["TongCong"].HeaderText = "Tổng cộng";
            dgrvHoaDon_KhachHang.Columns["MaND"].Visible = false;
            dgrvHoaDon_KhachHang.Columns["SDT"].Visible = false;
            dgrvHoaDon_KhachHang.Columns["TienDua"].Visible = false;
            dgrvHoaDon_KhachHang.Columns["TienThua"].Visible = false;
            dgrvHoaDon_KhachHang.Columns["QL_KHACHHANG"].Visible = false;
            dgrvHoaDon_KhachHang.Columns["QL_NGUOIDUNG"].Visible = false;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            setEnable(true);
            btnLuu.Visible = true;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            //if (qlkh.kiemtrakhoachinh(txtDienThoai.Text))
            //{
               

            //}
            //else
            //{
            //    MessageBox.Show("Số điện thoại: " + txtDienThoai.Text + " đã tồn tại");
            //}
            qlkh.suaKhachHang(txtDienThoai.Text, txtTenKhachHang.Text, txtCMND.Text, int.Parse(txtDiemSo.Text));
            MessageBox.Show("Sửa thành công");
            
            this.Close();
        }

        private void frmChiTietKhachHang_Load(object sender, EventArgs e)
        {
            int count = 0;
            count = dgrvHoaDon_KhachHang.Rows.Count;
            txtSoDonHang.Text = "Tổng số đơn hàng: " + count ;
            int tongtien = 0;
            for(int i = 0; i < count; i++)
            {
                tongtien += int.Parse(dgrvHoaDon_KhachHang.Rows[i].Cells["TongCong"].Value.ToString());
            }
            
            txtTongTien.Text = "Tổng tiền :" + tongtien;
        }
    }
}
