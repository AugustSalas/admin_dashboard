import 'package:admin_dashboard/models/categoria.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/categoria_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow getRow(int index) {
    final categoria = categorias[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(categoria.id)),
      DataCell(Text(categoria.nombre)),
      DataCell(Text(categoria.usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => CategoriaModal(
                    categoria: categoria,
                  ),
                );
              },
              icon: Icon(Icons.edit_outlined,
                  color: Colors.green.withOpacity(0.8))),
          IconButton(
            onPressed: () {
              final dialog = AlertDialog(
                title: const Text('Está seguro de borrarlo?'),
                content: Text('¿Borrar definitivamente ${categoria.nombre}?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () async {
                      await Provider.of<CategoriesProvider>(context,
                              listen: false)
                          .deleteCategory(categoria.id);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Si,borrar'),
                  ),
                ],
              );

              showDialog(context: context, builder: (_) => dialog);
            },
            icon:
                Icon(Icons.delete_outlined, color: Colors.red.withOpacity(0.8)),
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
