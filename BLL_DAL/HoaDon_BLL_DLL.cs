using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class HoaDon_BLL_DLL
    {
        dataFastFoodDataContext qlhd = new dataFastFoodDataContext();

        public HoaDon_BLL_DLL()
        {

        }

        public int demHD()
        {
            return qlhd.QL_HoaDon_BanHangs.Select(t => t).Count();
        }

        public bool ktKhoaChinhHD(string maHD)
        {
            return qlhd.QL_HoaDon_BanHangs.SingleOrDefault(t => t.MaHD == maHD) == null ? true : false;

        }

        public IQueryable<QL_HoaDon_BanHang> loadHoaDonTheoNgay(DateTime form, DateTime to)
        {
            var hoadon = from hd in qlhd.QL_HoaDon_BanHangs
                         where hd.NgayLap >= form && hd.NgayLap <= to
                         select hd;
            return hoadon;
        }

        public IQueryable<QL_HoaDon_BanHang> layHoaDon()
        {
            return qlhd.QL_HoaDon_BanHangs.Select(t => t);
        }

        public IQueryable<QL_ChiTietHoaDon> layChiTietHoaDon(string maHD)
        {
            return qlhd.QL_ChiTietHoaDons.Where(t => t.MaHD == maHD);
        }


        public IQueryable<QL_HoaDon_BanHang> loadGridViewTimKiemHoaDon(string txtTimKiem)
        {
            var hoadon = from hd in qlhd.QL_HoaDon_BanHangs
                            where hd.MaHD.Contains(txtTimKiem) ||
                            hd.MaND.Contains(txtTimKiem) ||
                            hd.MAKH.Contains(txtTimKiem) ||
                            hd.PhuongThuc.Contains(txtTimKiem)
                         select hd;
            return hoadon;

            //return qlkh.QL_KHACHHANGs.Where(kh => kh.HoTen.Contains(tenkh)).Select(kh => kh);
        }

        public string taoMaHD()
        {
            string maHD;

            string year = DateTime.Now.Year.ToString();
            string month = DateTime.Now.Month.ToString();
            string day = DateTime.Now.Day.ToString();

            string random = new Random().Next(1, 10000).ToString();

            maHD = year + month + day + random;
            return maHD;
        }

        public bool themHoaDon(List<QL_ChiTietHoaDon> lstCT, string maND, string maKH, string PhuongThuc, string tienDua, string tienThua, double TongCong, int soLuong)
        {
            try
            {
                string maHD = taoMaHD();
                while (!ktKhoaChinhHD(maHD))
                {
                    maHD = taoMaHD();
                }

                QL_HoaDon_BanHang newHD = new QL_HoaDon_BanHang();
                newHD.MaHD = maHD;
                newHD.MaND = maND;

                newHD.MAKH = maKH.Length != 0 ? maKH : "NULL";
               
                newHD.NgayLap = DateTime.Now.Date;
                newHD.PhuongThuc = PhuongThuc;
                newHD.TienDua = Convert.ToInt32(tienDua);
                newHD.TienThua = Convert.ToInt32(tienThua);
                newHD.TongCong = Convert.ToInt32(TongCong);
                qlhd.QL_HoaDon_BanHangs.InsertOnSubmit(newHD);
                qlhd.SubmitChanges();
                foreach (QL_ChiTietHoaDon item in lstCT)
                {
                    item.MaHD = maHD;
                    item.Soluong = soLuong;
                    qlhd.QL_ChiTietHoaDons.InsertOnSubmit(item);
                }
                qlhd.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }

        }
    }
}
