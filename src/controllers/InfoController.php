<?php

require_once PATH_CORE . 'Controller.php';

class InfoController extends Controller {
    
    public function clientSupport(): void {
        
        $data['title'] = INFO_SERVICE_CLIENT_WINDOW_TITLE;
        
        $data['stylesheets'][] = 'pages/service-client';

        $data['header'] = true;
		$data['footer'] = true;

        $this->view('info/service-client', $data);
    }

    public function contact(): void {
        
        $data['title'] = INFO_CONTACT_WINDOW_TITLE;
        
        $data['stylesheets'][] = 'pages/infoContact';

        $data['header'] = true;
		$data['footer'] = true;
		
        $this->view('info/contact', $data);
    }

    public function legalNotice(): void {
        
        $data['title'] = INFO_LEGAL_NOTICE_WINDOW_TITLE;
        
        $data['stylesheets'][] = 'pages/infoTermAndNotice';

        $data['header'] = true;
        $data['footer'] = true;

        $data['scripts'][] = [
			'name' => 'scrollerPage',
			'attr' => 'defer'
		];

        $data['scripts'][] = [
			'name' => 'fixElementUp',
			'attr' => 'defer'
		];
        
        $this->view('info/legalNotice', $data);
    }

    public function termsCondition(): void {
        
        $data['title'] = INFO_TERMS_CONDITIONS_WINDOW_TITLE;
        
        $data['stylesheets'][] = 'pages/infoTermAndNotice';

        $data['header'] = true;
        $data['footer'] = true;

        $data['scripts'][] = [
			'name' => 'scrollerPage',
			'attr' => 'defer'
		];

        $data['scripts'][] = [
			'name' => 'fixElementUp',
			'attr' => 'defer'
		];
        
        $this->view('info/termsCondition', $data);
    }

    public function shippingReturn(): void {
        
        $data['title'] = INFO_SHIPPING_RETURN_WINDOW_TITLE;
        
        $data['stylesheets'][] = 'pages/infoShippingReturn';

        $data['header'] = true;
        $data['footer'] = true;
        
        $data['scripts'][] = [
			'name' => 'scrollerPage',
			'attr' => 'defer'
		];

        $data['scripts'][] = [
			'name' => 'fixElementUp',
			'attr' => 'defer'
		];
        
        $this->view('info/shippingReturn', $data);
    }
}
