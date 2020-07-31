using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Management.Instrumentation;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class qlKhachHang_BLL_DAL
    {
        dataQLKhachHangDataContext qlkh = new dataQLKhachHangDataContext();

       

        public IQueryable<QL_KHACHHANG> loadGridViewKhachHang()
        {
            return qlkh.QL_KHACHHANGs.Select(kh => kh);
        }

        public int kiemtrakhoachinh(string sdt)
        {
            var khachhang = (from kh in qlkh.QL_KHACHHANGs
                             where kh.SDT.Equals(sdt)
                             select kh).FirstOrDefault();

            if (khachhang != null)
            {
                return -1;
            }
            return 1;

        }

        public void themKhachHang(string sodt, string hoten, string cmnd)
        {
            QL_KHACHHANG insertkh = new QL_KHACHHANG();
            insertkh.SDT = sodt;
            insertkh.HoTen = hoten;
            insertkh.CMND = cmnd;
            qlkh.QL_KHACHHANGs.InsertOnSubmit(insertkh);
            qlkh.SubmitChanges();
        }
        public void suaKhachHang(string sodt, string hoten, string cmnd, int diem)
        {
            QL_KHACHHANG updateKhachHang = qlkh.QL_KHACHHANGs.Where(t => t.SDT == sodt).FirstOrDefault();
            if(updateKhachHang != null)
            {
                //updateKhachHang.SDT = sodt;
                updateKhachHang.HoTen = hoten;
                updateKhachHang.CMND = cmnd;
                updateKhachHang.DiemSo = diem;
                
            }
            qlkh.SubmitChanges();
            loadGridViewKhachHang();

        }

        public IQueryable<QL_HoaDon_BanHang> loadDonHangTheoKhachHang(string sdt)
        {
            
             var khachhang = (from kh in qlkh.QL_HoaDon_BanHangs
                             select new QL_HoaDon_BanHang
                             {
                                MaHD =  kh.MaHD,
                                NgayLap =  kh.NgayLap,
                                PhuongThuc =kh.PhuongThuc
                             });

            return qlkh.QL_HoaDon_BanHangs.Where(kh => kh.SDT==sdt).Select(kh => kh);
           
        }

        public IQueryable<QL_HoaDon_BanHang> loadDonHangTheoSDTKhachHang(string sdt)
        {
            var khachhang = from kh in qlkh.QL_HoaDon_BanHangs
                            select kh;
            //var khachhang = (from kh in qlkh.QL_HoaDon_BanHangs
            //                 where kh.SDT == sdt
            //                 select new QL_HoaDon_BanHang
            //                 {
            //                     MaHD = kh.MaHD,
            //                     NgayLap = kh.NgayLap,
            //                     PhuongThuc = kh.PhuongThuc,
            //                     TongCong = kh.TongCong
            //                 });
            return khachhang;
        }

        public IQueryable<QL_SanPham> loadSanPham(string sdt)
        {
            var sanpham = from QL_SanPham sp in qlkh.QL_SanPhams
                          join QL_ChiTietHoaDon hd in qlkh.QL_ChiTietHoaDons 
                          on sp.MaSP equals hd.MaSP
                          join hd_kh in qlkh.QL_HoaDon_BanHangs
                          on hd.MaSP equals hd_kh.MaHD
                          where hd_kh.SDT == sdt
                          select sp;
            return sanpham;
        }
       

        
        



    }
}
