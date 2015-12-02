
<?= $this->Form->create( "Repository", array( "class" => "form-horizontal", 'enctype' => 'multipart/form-data' )); ?> 
<?= $this->Form->input("Repository.file", array('label' => false, 'escape' => false, 'type' => 'file')) ?>
<?= $this->element( "submit", array( 'cancel' => '/repositories' ) ) ?>