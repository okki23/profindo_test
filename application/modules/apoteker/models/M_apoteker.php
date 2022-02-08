<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_apoteker extends Parent_Model { 
   
      var $nama_tabel = 'tb_apoteker';
      var $daftar_field = array('kode_apoteker','nama_apoteker','tanggal_lahir'); 
      var $primary_key = 'id';

	  
  public function __construct(){
        parent::__construct();
        $this->load->database();
  }
  public function fetch_apoteker(){
      
		   $getdata = $this->db->get($this->nama_tabel)->result();
		   $data = array();  
		   $no = 1;
           foreach($getdata as $row)  
           {  
                $sub_array = array();  
             
                $sub_array[] = $row->kode_apoteker;  
                $sub_array[] = $row->nama_apoteker;   
                $sub_array[] = $row->tanggal_lahir;   
              /**
               * 
               * \'single quotes\'
               */
		    $sub_array[] = '<a href="javascript:void(0)" class="btn btn-warning btn-xs waves-effect" id="edit" onclick="Ubah_Data('"\.'$row->kode_apoteker\');" > <i class="material-icons">create</i> Ubah </a> 
								&nbsp; <a href="javascript:void(0)" id="delete" class="btn btn-danger btn-xs waves-effect" onclick="Hapus_Data('.$row->kode_apoteker.');" > <i class="material-icons">delete</i> Hapus </a>';  
                $sub_array[] = $row->kode_apoteker;
                $data[] = $sub_array;  
                 $no++;
           }  
          
		   return $output = array("data"=>$data);
		    
    }
 
	 
 
}
