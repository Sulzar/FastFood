using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    
    public class SanPham_BLL_DAL
    {
        #region Properties

        dataFastFoodDataContext qlsp = new dataFastFoodDataContext();

        #endregion

        #region Method

        // tim san pham

        public List<QL_SanPham> searchSP(string masp)
        {
            return qlsp.QL_SanPhams.Where(t => t.TenSanPham.Contains(masp)).ToList();
        }

        //lay tat ca san pham
        public List<QL_SanPham> getALLSP()
        {
            return qlsp.QL_SanPhams.Select(t => t).ToList();
        }

        // lay tat ca san pham cho grid view
        public IQueryable<QL_SanPham> getALLSPGV()
        {
            return qlsp.QL_SanPhams.Select(t => t);
        }

        public IQueryable<QL_SanPham> getALLByLoai(string maloai)
        {
            return qlsp.QL_SanPhams.Where(t => t.MaLoaiSP == maloai);
        }

        public List<QL_SanPham> getALLByLoaiList(string maloai)
        {
            return qlsp.QL_SanPhams.Where(t => t.MaLoaiSP == maloai).ToList();
        }

        // lay Loai Nguyen Lieu
        public List<QL_LoaiNguyenLieu> getALLCateNL()
        {
            return qlsp.QL_LoaiNguyenLieus.Select(t => t).ToList();
        }

        // Lay Nguyen Lieu Theo ma
        public IQueryable<QL_NguyenLieu> getALLNguyenLieuByLoai(string maloaiNL)
        {
            return qlsp.QL_NguyenLieus.Where(t => t.MaLoaiNL == maloaiNL);
        }

        // Lay cac san pham co nguyen lieu do
        public IQueryable<QL_SanPham> getALLSanPhamByNguyenLieu(string maNL)
        {
            return from sp in qlsp.QL_SanPhams
                   from sp_nl in qlsp.QL_NguyenLieu_SanPhams
                   where sp.MaSP == sp_nl.MaSP && sp_nl.MaNL == maNL
                   select sp;
        }

        // lay tat ca loai san pham
        public IQueryable<QL_LoaiSanPham> getAllLoaiSP(string maTenSP)
        {
            return qlsp.QL_LoaiSanPhams.Select(t => t);
        }

        // lay tat ca san pham theo loai
        public IQueryable<QL_SanPham> getALLSanPhamByLoai(string maloaiSP)
        {
            return qlsp.QL_SanPhams.Where(t => t.MaLoaiSP == maloaiSP);
        }



        // lay san pham theo loai nguyen lieu       

        public List<QL_SanPham> laySPTheoLoaiNL(string maloaiNL)
        {
            List<QL_SanPham> lstSP = new List<QL_SanPham>();

            List<QL_NguyenLieu> lstnl = getALLNguyenLieuByLoai(maloaiNL).ToList();

            foreach (QL_NguyenLieu item in lstnl)
            {
                foreach (QL_SanPham itemsp in getALLSanPhamByNguyenLieu(item.MaNL))
                {
                    lstSP.Add(itemsp);
                }
            }

            return lstSP;
            
        }

        public QL_SanPham laySP(string maSP)
        {
            return qlsp.QL_SanPhams.SingleOrDefault(t => t.MaSP == maSP);
        }


        public IQueryable loadAllLoai()
        {
            return qlsp.QL_LoaiSanPhams.Select(t => t);
        }

        // load loai san pham
        public IQueryable laySPAndLoai()
        {
            return (from sp in qlsp.QL_SanPhams from loai in qlsp.QL_LoaiSanPhams where sp.MaLoaiSP == loai.MaLoaiSP select new { sp.MaSP, sp.TenSanPham, sp.Gia, sp.TinhTrang, sp.Hinh, loai.TenLoai }).Distinct();
        }

        public List<QL_SanPham> laySPTheoLoai(string maLoai)
        {
            QL_LoaiSanPham loai = qlsp.QL_LoaiSanPhams.SingleOrDefault(t => t.MaLoaiSP == maLoai);
            List<QL_SanPham> lst = getALLByLoaiList(maLoai);
            foreach (QL_SanPham item in lst)
            {
                item.TenLoai = loai.TenLoai; 
            }
            return lst;
            
        }
        
        // lay Bang San pham _ Loai
        public List<QL_SanPham> laySPAndLoaiTheoLoai(string maloai)
        {            
            return (from sp in qlsp.QL_SanPhams from loai in qlsp.QL_LoaiSanPhams where sp.MaLoaiSP == loai.MaLoaiSP && sp.MaLoaiSP == maloai select new QL_SanPham(sp,loai.TenLoai)).Distinct().ToList();
        }
        
        // Lay all SP_NguyenLieu

        public List<QL_NguyenLieu_SanPham> laySP_NL(string maSP)
        {
            return qlsp.QL_NguyenLieu_SanPhams.Where(t => t.MaSP == maSP).ToList();
        }

        public List<QL_NguyenLieu> layNL_SanPham(string tenNL)
        {
            return qlsp.QL_NguyenLieus.Where(t => t.TenNL.Contains(tenNL)).ToList();
        }

        public List<QL_NguyenLieu> LayTatCaNguyenLieu()
        {
            return qlsp.QL_NguyenLieus.Select(t => t).ToList() ;
        }
        

        #endregion
    }
}
