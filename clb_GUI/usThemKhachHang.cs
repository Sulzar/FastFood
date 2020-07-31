using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL_DAL;


namespace clb_GUI
{
    public partial class usThemKhachHang : UserControl
    {
        qlKhachHang_BLL_DAL qlkh = new qlKhachHang_BLL_DAL();
       
        public usThemKhachHang()
        {
            InitializeComponent();
            txtCMND.Text = "";
            txtHoTen.Text = "";
            txtSoDienThoai.Text = "";
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Visible = false;

        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtHoTen.Text))
                {
                    MessageBox.Show(lbHoTen.Text + " không được bỏ trống");
                }
                else if (string.IsNullOrEmpty(txtCMND.Text))
                {
                    MessageBox.Show(lbCMND.Text + " không được bỏ trống");
                }
                else if (string.IsNullOrEmpty(txtSoDienThoai.Text))
                {
                    MessageBox.Show(lbSDT.Text + " không được bỏ trống");
                }
                else if(txtCMND.Text.Length != 9)
                {
                    MessageBox.Show(lbCMND.Text + " không hợp lệ");
                }
                else if(txtSoDienThoai.Text.Length != 10)
                {
                    MessageBox.Show(lbSDT.Text + " không hợp lệ");
                }
                else if (qlkh.kiemtrakhoachinh(txtSoDienThoai.Text)==1)
                {
                  
                    qlkh.themKhachHang(txtSoDienThoai.Text, txtHoTen.Text, txtCMND.Text);
                    MessageBox.Show("Thêm thành công");
                    MessageBox.Show("Vui lòng làm mới lại ");
                    this.Visible = false;
                    txtCMND.Text = "";
                    txtHoTen.Text = "";
                    txtSoDienThoai.Text = "";
                }
                else
                {
                    MessageBox.Show(qlkh.kiemtrakhoachinh(txtSoDienThoai.Text) + "");
                    MessageBox.Show("Số điện thoại: " + txtSoDienThoai.Text + " đã được đăng kí");
                    txtSoDienThoai.Clear();
                }    

            }
            catch
            {
                MessageBox.Show("Lỗi do hệ thống!");
            }
        }
    }
}
