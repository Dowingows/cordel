<?= $this->Html->script(array('ckeditor/ckeditor.js')); ?>
<?= $this->Html->script(array('ckeditor/pt-br.js')); ?>

<?= $this->Form->create('Setting', array('class' => 'form-horizontal')); ?>
<?= $this->Form->hidden('Setting.id'); ?>


<div class="row">
    <div class="span6">
        <legend>Dados</legend>
        <fieldset>
        <?php
        print $this->BForm->input('Setting.email_admin', array('label' => 'Email do administrador', 'type' => 'email'));
        print $this->BForm->input('Setting.email_contact', array('label' => 'Email para contato', 'type' => 'email'));
        print $this->BForm->input('Setting.phone', array('label' => 'Telefone'));
        print $this->BForm->input('Setting.cell_phone', array('label' => 'Celular'));
        print $this->BForm->input('Setting.facebook_link', array('label' => 'Facebook'));
        print $this->BForm->input('Setting.twitter_link', array('label' => 'Twitter'));
        ?>
        </fieldset>
    </div>
    <div class="span6">
        <legend>Texto de boas-vindas</legend>
        <fieldset>
      <?=  $this->Form->input('Setting.wellcome_text', array('label' => false,'required'=>false,'class'=>'ckeditor'))?>
        <!--<textarea class="ckeditor" name="editor1">Write any thing</textarea>-->
        </fieldset>
    </div>
</div>

<?= $this->element("submit", array('cancel' => '/Settings')) ?>