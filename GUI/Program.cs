﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
           // Application.Run(new frmLogin());
              Application.Run(new frmMain());
           // Application.Run(new frmKhachHang());
           // Application.Run(new frmPOS());
            //Application.Run(new frmPhieuDatHang());
         // Application.Run(new frmNguyenLieu());
        }
    }
}
