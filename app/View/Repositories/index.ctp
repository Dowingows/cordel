<?php if (empty($repositories)): ?>

    <p class="alert alert-info nothing"><i class="icon-info-sign"></i> Não há nenhum arquivo ainda. <?= $this->Html->link('Enviar arquivo', '/repositories/add', array('class' => 'btn btn-mini')) ?></p>

<?php else : ?>

    <table class="table table-striped">
        <thead>
            <tr>
                <th class="pic"></th>
                <th><?= $this->Paginator->sort("name", "Nome") ?></th>
                <th><?= $this->Paginator->sort("type", "Tipo") ?></th>
                <th><?= $this->Paginator->sort("size", "Tamanho (KB)") ?></th>
                <th><?= $this->Paginator->sort("size", "Enviado em") ?></th>
                <th>A&ccedil;&otilde;es</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($repositories as $repository): ?>

                <tr>
                    <td><i class="icon-file"></i></td>
                    <td><?= $this->Html->link($repository['Repository']['name'], $this->FrontEnd->repositoryLink($repository['Repository']['id']), array('escape' => false)) ?></td>
                    <td><?= $repository['Repository']['type'] ?></td>
                    <td><?= (double)($repository['Repository']['size']/1000) ?></td>
                    <td><?= $this->FrontEnd->nicedate($repository['Repository']['created']); ?></td>
                    <td><?=  $this->Html->link( '<i class="icon-trash icon-white"></i>', "/repositories/delete/{$repository['Repository']['id']}", array( 'class' => 'btn btn-mini btn-danger delete', 'escape' => false ) );?></td>
                </tr>

            <?php endforeach; ?>
        </tbody>
    </table>
<?php endif; ?>
<?php print $this->element("pagination"); ?>