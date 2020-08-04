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
    public partial class frmPhieuDatHang : Form
    {
        NguyenLieu_BLL_DAL nl = new NguyenLieu_BLL_DAL();
        BLL_DAL_NhaCungCap ncc = new BLL_DAL_NhaCungCap();
        BLL_DAL_PhieuDatHang dh = new BLL_DAL_PhieuDatHang();
        BLL_DAL_ChiTietPhieuDatHang ct = new BLL_DAL_ChiTietPhieuDatHang();

        string maNLDangChon;
        string tenNLDangChon;
        string maPhieuDangChon;
        string maND = "ND01";

        public frmPhieuDatHang()
        {
            InitializeComponent();
        }

        //>>>>>>>>>> HÀM <<<<<<<<<<

        // Kiểm tra các textbox vs combobox
        private bool kiemTraNhapChiTiet()
        {
            if (txt_SoLuong.Text != "")
            {
                if (txt_DonGia.Text != "")
                {
                    return true;
                }
                else
                {
                    MessageBox.Show("Không được để trống đơn giá");
                    return false;
                }
            }
            else
            {
                MessageBox.Show("Không được để trống số lượng");
                return false;
            }
        }

        // Bỏ chọn tất cả các grid
        void boChonGrid()
        {
            dataGridViewNguyenLieu.ClearSelection();
            dataGridViewPhieuDatHang.ClearSelection();
            dataGridViewChiTiet.ClearSelection();
        }

        // load cbo Nhà cung cấp
        void load_cbo()
        {
            // cbo Nhà cung cấp
            cbo_NhaCungCap.DataSource = ncc.loadNhaCungCap();
            cbo_NhaCungCap.DisplayMember = "TenNCC";
            cbo_NhaCungCap.ValueMember = "MaNCC";
            cbo_NhaCungCap.SelectedIndex = 0;

            // cbo Tình trạng
            cbo_TinhTrang.Items.Add("Chưa thanh toán");
            cbo_TinhTrang.Items.Add("Đã thanh toán");
            cbo_TinhTrang.SelectedIndex = 0;

            // cbo Phương thức
            cbo_PhuongThuc.Items.Add("Online");
            cbo_PhuongThuc.Items.Add("Thủ công");
            cbo_PhuongThuc.SelectedIndex = 0;
        }


        // Load grid 
        void load_DataGridView()
        {
            // dgv Nguyen Lieu
            dataGridViewNguyenLieu.DataSource = nl.loadNguyenLieu();

            // dgv Phieu Dat Hang
            dataGridViewPhieuDatHang.DataSource = dh.loadPhieuDatHang();

            // dgv Chi Tiet Phieu Dat Hang
            dataGridViewChiTiet.DataSource = ct.load_ChiTietPhieuDatHang();
        }

        //>>>>>>>>>> KẾT THÚC HÀM <<<<<<<<<<

        private void btnThemNguyenLieuVaoChiTiet_Click(object sender, EventArgs e)
        {
            if (ct.ktTrung(maNLDangChon) == true)
            {
                if (kiemTraNhapChiTiet() == true)
                {
                    ct.themChiTietPhieuNhap(maPhieuDangChon, maNLDangChon, txt_DonViTinh.Text, Convert.ToInt32(txt_SoLuong.Text), Convert.ToInt32(txt_DonGia.Text));
                    dataGridViewChiTiet.DataSource = ct.load_chiTietPhieuDatHangTheoMa(maPhieuDangChon);
                    MessageBox.Show("Thêm thành công");
                }
            }
            else
                MessageBox.Show("Nguyên liệu này đã đặt, bạn cần chọn nguyên liệu khác");
        }

        private void btnThemPhieuDatHang_Click(object sender, EventArgs e)
        {
            btnLuuPhieuDatHang.Enabled = true;
            dh.themPhieuDatHang(txt_maPhieu.Text, cbo_NhaCungCap.SelectedValue.ToString(), Convert.ToDateTime(txt_NgayNhap.Text), Convert.ToInt32(txt_TongTien.Text), txt_NhanVienDat.Text, cbo_PhuongThuc.Text, cbo_TinhTrang.Text);
            MessageBox.Show("Thêm thành công");
            load_DataGridView();
            btnThemPhieuDatHang.Enabled = false;
        }

        private void btnXoaDongChiTietPDH_Click(object sender, EventArgs e)
        {
            if (dataGridViewChiTiet.SelectedCells.Count > 0)
            {
                int vt = dataGridViewChiTiet.SelectedCells[0].RowIndex;
                ct.xoaChiTietPhieuDatHang(dataGridViewChiTiet.Rows[vt].Cells[0].Value.ToString(), dataGridViewChiTiet.Rows[vt].Cells[1].Value.ToString());
                MessageBox.Show("Xóa thành công");
                load_DataGridView();
            }

        }

        private void guna2ControlBox1_Click(object sender, EventArgs e)
        {

        }

        private void frmPhieuDatHang_Load(object sender, EventArgs e)
        {
            load_cbo();
            load_DataGridView();
        }

        private void dataGridViewNguyenLieu_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridViewNguyenLieu.SelectedCells.Count > 0)
            {
                int vitri = dataGridViewNguyenLieu.SelectedCells[0].RowIndex;
                maNLDangChon = dataGridViewNguyenLieu.Rows[vitri].Cells[0].Value.ToString().Trim();
                tenNLDangChon = dataGridViewNguyenLieu.Rows[vitri].Cells[1].Value.ToString().Trim();
                txt_DonViTinh.Text = dataGridViewNguyenLieu.Rows[vitri].Cells[2].Value.ToString().Trim();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnLamMoiPhieuDat_Click(object sender, EventArgs e)
        {
            btnThemPhieuDatHang.Enabled = true;
            txt_TongTien.Text = "0";
            txt_NgayNhap.Text = DateTime.Now.ToString();
            txt_NhanVienDat.Text = maND;
            txt_maPhieu.Text = dh.taoMaPhieuDatHang();
            //txt_NgayNhap.Text = DateTime.Now.Day + "/ " + DateTime.Now.Month + "/ " + DateTime.Now.Year + "";
        }

        private void dataGridViewPhieuDatHang_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridViewPhieuDatHang.SelectedCells.Count > 0)
            {
                int vt = dataGridViewPhieuDatHang.SelectedCells[0].RowIndex;
                maPhieuDangChon = dataGridViewPhieuDatHang.Rows[vt].Cells[0].Value.ToString().Trim();
                txt_maPhieu.Text = maPhieuDangChon;
                cbo_NhaCungCap.Text = dataGridViewPhieuDatHang.Rows[vt].Cells[1].Value.ToString().Trim();
                txt_NgayNhap.Text = dataGridViewPhieuDatHang.Rows[vt].Cells[2].Value.ToString().Trim();
                txt_TongTien.Text = dataGridViewPhieuDatHang.Rows[vt].Cells[3].Value.ToString().Trim();
                txt_NhanVienDat.Text = dataGridViewPhieuDatHang.Rows[vt].Cells[4].Value.ToString().Trim();
                cbo_PhuongThuc.Text = dataGridViewPhieuDatHang.Rows[vt].Cells[5].Value.ToString().Trim();
                cbo_TinhTrang.Text = dataGridViewPhieuDatHang.Rows[vt].Cells[6].Value.ToString().Trim();
                dataGridViewChiTiet.DataSource = ct.load_chiTietPhieuDatHangTheoMa(maPhieuDangChon);
            }

        }

        private void toolStripSua_Click(object sender, EventArgs e)
        {
            if (dataGridViewChiTiet.SelectedCells.Count > 0)
            {
                int vt = dataGridViewChiTiet.SelectedCells[0].RowIndex;
                string maDH = dataGridViewChiTiet.Rows[vt].Cells[0].Value.ToString().Trim();
                string maNL = dataGridViewChiTiet.Rows[vt].Cells[1].Value.ToString().Trim();
                string DVT = txt_DonViTinh.Text;
                int SL = Convert.ToInt32(txt_SoLuong.Text);
                int donGia = Convert.ToInt32(txt_DonGia.Text);
                ct.suaChiTiet(maDH, maNL, DVT, SL, donGia);
                MessageBox.Show("Sửa thành công");
                load_DataGridView();
            }
        }

        private void toolStripXoa_Click(object sender, EventArgs e)
        {
            if (dataGridViewChiTiet.SelectedCells.Count > 0)
            {
                int vt = dataGridViewChiTiet.SelectedCells[0].RowIndex;
                ct.xoaChiTietPhieuDatHang(dataGridViewChiTiet.Rows[vt].Cells[0].Value.ToString(), dataGridViewChiTiet.Rows[vt].Cells[1].Value.ToString());
                MessageBox.Show("Xóa thành công");
                load_DataGridView();
            }
        }

        private void dataGridViewChiTiet_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Tab && dataGridViewChiTiet.CurrentCell.ColumnIndex == 1)
            {
                e.Handled = true;
                DataGridViewCell cell = dataGridViewChiTiet.Rows[0].Cells[0];
                dataGridViewChiTiet.CurrentCell = cell;
                dataGridViewChiTiet.BeginEdit(true);
            }
        }

        private void dataGridViewChiTiet_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridViewChiTiet.SelectedCells.Count > 0)
            {
                int vt = dataGridViewChiTiet.SelectedCells[0].RowIndex;
                txt_SoLuong.Text = dataGridViewChiTiet.Rows[vt].Cells[2].Value.ToString().Trim();
                txt_DonGia.Text = dataGridViewChiTiet.Rows[vt].Cells[3].Value.ToString().Trim();
                txt_DonViTinh.Text = dataGridViewChiTiet.Rows[vt].Cells[4].Value.ToString().Trim();
            }
        }
    }
}
