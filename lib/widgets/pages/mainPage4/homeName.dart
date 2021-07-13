part of 'mainPage4.dart';

class _NameHome extends StatefulWidget {
  @override
  __NameHomeState createState() => __NameHomeState();
}

class __NameHomeState extends State<_NameHome> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NameBloc, NameState>(
      builder: (context, state) => ListTile(
        onTap: () {
          showAlertNameEdit(context, state.name);
        },
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GenericCardTitle(
            title: '${AppLocalizations.of(context)!.mainPage4_homeName_name}',
          ),
        ),
        subtitle: (state.name.length > 0)
            ? GenericCardSubtitle(
                title: '${state.name}',
              )
            : null,
      ),
    );
  }
}

Future<void> showAlertNameEdit(BuildContext context, String name) async {
  return await showDialog(
    context: context,
    builder: (context) {
      String _newValueAdd = name;
      GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Editar nombre',
          style: AppFont.fontTitleDialog(context),
        ),
        content: Form(
          key: _formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              'Ingresa el nuevo nombre',
              style: AppFont.fontHeadline2(context),
            ),
            SizedBox(
              height: 16,
            ),
            GenericInput(
              controller: TextEditingController(text: name),
              autofocus: true,
              validator: (String? value) {
                return value!.isNotEmpty ? null : 'Campo vacío';
              },
              onChanged: (value) {
                _newValueAdd = value;
              },
              maxLength: 32,
              hintText: 'Nombre',
            ),
          ]),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancelar'.toUpperCase(),
              style: AppFont.fontTextButton(context),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(
              'Actualizar'.toUpperCase(),
              style: AppFont.fontTextButton(context),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<NameBloc>(context)
                    .add(ChangeName(_newValueAdd));
                _newValueAdd = '';
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
