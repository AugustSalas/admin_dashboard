import 'package:admin_dashboard/models/categoria.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriaModal extends StatefulWidget {
  final Categoria? categoria;

  const CategoriaModal({super.key, this.categoria});

  @override
  State<CategoriaModal> createState() => _CategoriaModalState();
}

class _CategoriaModalState extends State<CategoriaModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoriaProvider = Provider.of<CategoriesProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: builBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoria?.nombre ?? 'Nueva categoría',
                style: CustomLabels.h1.copyWith(
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Divider(color: Colors.white.withOpacity(0.3)),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.loginInputDecoration(
              hint: 'Nombre de la categoría',
              label: 'Categoría',
              icon: Icons.new_releases_outlined,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                try {
                  if (id == null) {
                    await categoriaProvider.newCategory(nombre);
                    NotificationsService.showSnackbar('$nombre creada!');
                  } else {
                    await categoriaProvider.updateCategory(id!, nombre);
                    NotificationsService.showSnackbar('$nombre Actualizada!');
                  }
                  Navigator.of(context).pop();
                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationsService.showSnackbarError(
                      'No se pudo guardar la categoría');
                }
                
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration builBoxDecoration() => const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color(0xff0F2041),
        boxShadow: [
          BoxShadow(color: Colors.black26),
        ],
      );
}
