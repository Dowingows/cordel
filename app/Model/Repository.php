<?php

class Repository extends AppModel {
    /* ----------------------------------------
     * Atributtes
      ---------------------------------------- */

    public $name = 'Repository';
    public $label = 'Repositório';
    private $folder = 'files';
    private $fieldName = 'file';
    public $allowedExt = array('jpg', 'png');
    public $lastFile = "";
    /* ----------------------------------------
     * Associations
      ---------------------------------------- */




    /* ----------------------------------------
     * Validation
      ---------------------------------------- */
    public $validate = array(
        "file" => array(
            'rule' => array('allowedExtension'),
            'message' => 'Apenas arquivos de imagem.',
        ),
    );

    public function checkExtension($extensions, $extension) {
        foreach ($extensions as $ext) {
            if ($ext == $extension) {
                return true;
            }
        }
        return false;
    }

    public function allowedExtension($check) {

        $ext = $check['file']['name'];
        $point = strrpos($ext, '.');
        $ext = substr($ext, $point + 1, (strlen($ext) - $point));

        if (!empty($ext)) {
            if ($this->checkExtension($this->allowedExt, $ext)) {
                return true;
            }
            return 'Somente esses arquivos suportados: ' . implode(", ", $this->allowedExt);
        } else {
            return 'Arquivo deve ter uma extensão válida';
        }
    }

    /* ----------------------------------------
     * Callbacks
      ---------------------------------------- */

    public function beforeSave($options = array()) {
        parent::beforeSave($options);
        if (!empty($this->data['Repository'][$this->fieldName])) {
            $file = $this->data['Repository'][$this->fieldName];
            $data_table = $this->uploadFile($file);
            $data_table['created'] = $this->data['Repository']['created'];
            $data_table['modified'] = $this->data['Repository']['modified'];
            $this->data = array();
            $this->data['Repository'] = $data_table;
            return true;
        } else {
            return false;
        }
    }

    /* ----------------------------------------
     * Util
      ---------------------------------------- */

    public function getAbsolutePath() {
        return WWW_ROOT . $this->folder;
    }

    public function isWriteFolder() {
        return is_writable($this->getAbsolutePath());
    }

    public function getImageUrl($repository_id) {
        $link = "";
        $file = $this->findById($repository_id);

        if (!empty($file)) {
            $link = $file['Repository']['file_name'];
        }

        return $link;
    }

    private function uploadFile($file) {
        $fileObject = new File($file['tmp_name']);
        $ext = $file['name'];
        $point = strrpos($ext, '.');
        $ext = substr($ext, $point + 1, (strlen($ext) - $point));

        $generate_name = md5(microtime());

        $filename = $generate_name . '.' . $ext;

        $data = $fileObject->read();
        $fileObject->close();

        $path_absolute = $this->getAbsolutePath() . DS;

        $fileObject = new File($path_absolute . $filename, true);
        $this->lastFile = $path_absolute . $filename;
        $fileObject->write($data);
        $fileObject->close();

        $repository_data = array('name' => substr($file['name'], 0, $point), 'file_name' => $filename, 'type' => $ext, 'size' => $file['size']);

        return $repository_data;
    }

    public function deleteFile($repository_id) {
        $success = false;
        $file = $this->findById($repository_id);

        if (!empty($file)) {
            try {

                $dataSource = $this->getDataSource();
                $dataSource->begin();

                $success = $this->delete($repository_id);

                if ($success) {

                    $file = new File($this->getAbsolutePath() . DS . $file['Repository']['file_name'], false, 0777);
                    if ($file->delete()) {
                        $dataSource->commit();
                        $success = true;
                    } else {
                        $dataSource->rollback();
                        $success = false;
                    }
                }
            } catch (Exception $e) {
                $success = false;
            }
        }

        return $success;
    }

}
