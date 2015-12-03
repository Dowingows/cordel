<?php

class Setting extends AppModel {
    /* ----------------------------------------
     * Atributtes
      ---------------------------------------- */

    public $name = 'Setting';
    public $label = 'Configura&ccedil;&atilde;o';

    /* ----------------------------------------
     * Associations
      ---------------------------------------- */


    /* ----------------------------------------
     * Validation
      ---------------------------------------- */
    public $validate = array(
        "email_admin" => array(
            'rule' => 'email',
            'message' => 'Informe um email válido!',
            'allowEmpty' => true
        ),
        "email_contact" => array(
            'rule' => 'email',
            'message' => 'Informe um email válido!',
            'allowEmpty' => true
        ),
    );

}
