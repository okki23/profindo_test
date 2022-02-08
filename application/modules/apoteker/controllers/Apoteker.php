<?php
defined('BASEPATH') OR exit('No direct script access allowed');
 

class Apoteker extends Parent_Controller {
  

  var $nama_tabel = 'tb_apoteker';
  var $daftar_field = array('kode_apoteker','nama_apoteker','tanggal_lahir'); 
  var $primary_key = 'kode_apoteker';
 
  
 	public function __construct(){
 		parent::__construct();
 		$this->load->model('m_apoteker');
 
		if(!$this->session->userdata('username')){
		   echo "<script language=javascript>
				 alert('Anda tidak berhak mengakses halaman ini!');
				 window.location='" . base_url('login') . "';
				 </script>";
		}
 	}

  
	public function index(){
		$data['judul'] = $this->data['judul']; 
		$data['konten'] = 'apoteker/apoteker_view';
		$this->load->view('template_view',$data);		
   
	}
 
  	public function fetch_apoteker(){  
       $getdata = $this->m_apoteker->fetch_apoteker();
       echo json_encode($getdata);   
  	}  

  	public function fetch_cat_apoteker(){  
       $getdata = $this->m_apoteker->fetch_cat_apoteker();
       echo json_encode($getdata);   
  	} 
	
   
	public function get_data_edit(){
		$id = $this->uri->segment(3); 
		$sql = $this->db->where('kode_apoteker',$id)->get($this->nama_tabel)->row();
		// $sql = "select a.*,b.nama_jabatan from m_apoteker a
		// left join m_jabatan b on b.id = a.id_jabatan where a.id = '".$id."' "; 
		// $get = $this->db->query($sql)->row();
		echo json_encode($sql,TRUE);
	}
	 
	public function hapus_data(){
		$id = $this->uri->segment(3);   
    	$sqlhapus = $this->m_apoteker->hapus_data($id);
		
		if($sqlhapus){
			$result = array("response"=>array('message'=>'success'));
		}else{
			$result = array("response"=>array('message'=>'failed'));
		}
		
		echo json_encode($result,TRUE);
	}
	 
	public function simpan_data(){
    
    
    $data_form = $this->m_apoteker->array_from_post($this->daftar_field);

    $kode_apoteker = isset($data_form['kode_apoteker']) ? $data_form['kode_apoteker'] : NULL; 
 

    $simpan_data = $this->m_apoteker->simpan_data($data_form,$this->nama_tabel,$this->primary_key,$kode_apoteker);
    
		if($simpan_data){
			$result = array("response"=>array('message'=>'success'));
		}else{
			$result = array("response"=>array('message'=>'failed'));
		}
		
		echo json_encode($result,TRUE);

	}
   
}
