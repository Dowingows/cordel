<?= $this->Form->create('Setting', array('class' => 'form-horizontal')); ?>

<div class="row">
    <div class="span6">
        <?php
        print $this->BForm->input('Setting.wellcome_text', array('label' => 'Texto de boas vindas'));
        print $this->BForm->input('Setting.email_admin', array('label' => 'Email do administrador', 'type' => 'email'));
        print $this->BForm->input('Setting.email_contact', array('label' => 'Email para contato', 'type' => 'email'));
        print $this->BForm->input('Setting.phone', array('label' => 'Telefone'));
        print $this->BForm->input('Setting.cell_phone', array('label' => 'Celular'));
        print $this->BForm->input('Setting.facebook_link', array('label' => 'Facebook'));
        print $this->BForm->input('Setting.twitter_link', array('label' => 'Twitter'));
       
        ?>
    </div>
</div>

<?= $this->element("submit", array('cancel' => '/Settings')) ?>