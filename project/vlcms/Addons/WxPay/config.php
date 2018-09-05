<?php
return array(
	'group'=>array(
		'type'=>'group',
		'options'=>array(
			'random'=>array(//配置在表单中的键名 ,这个会是config[random]
				'title'=>'基础设置',//表单的文字
				'type'=>'radio',		 //表单的类型：text、textarea、checkbox、radio、select等
				'options'=>array(		 //select 和radion、checkbox的子选项
					'1'=>'开启',		 //值=>文字
					'0'=>'关闭',
				),
				'value'=>'1',			 //表单的默认值
			),
			'basicsettings'=>array(
				'title'=>'基本设置',
				'options'=>array(
					'APPID'=>array(
						'title'=>'APPID',
						'type'=>'text',		 
						'value'=>'',
						'tip'=>'APPID是微信提供的唯一识别码',
					),
					'MCHID'=>array(
						'title'=>'MCHID',
						'type'=>'text',		 
						'value'=>'',
						'tip'=>'MCHID是微信提供的唯一识别码',
					),
					'KEY'=>array(
						'title'=>'key',
						'type'=>'text',		 
						'value'=>'',
						'tip'=>'key是微信提供的唯一识别码',
					),
					'APPSECRET'=>array(
						'title'=>'APPSECRET',
						'type'=>'text',		 
						'value'=>'',
						'tip'=>'APPSECRET是微信提供的唯一识别码',
					)
				),
			),
		),
	),
);
					