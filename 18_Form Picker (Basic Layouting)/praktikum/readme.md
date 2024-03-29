# (18) Form Picker (Basic Layouting)
Nomor Urut: 1_011FLB_40

Nama: Fiela Junita Azhari

## Task
![task](../screenshots/task.png)
### Input
#### main.dart
    import 'package:flutter/material.dart';

    import 'create_post_page.dart';

    void main() {
    runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Create Post',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: const CreatePostPage(),
        );
    }
    }
#### create_post.dart
    import 'dart:io';

    import 'package:create_post/preview_page.dart';
    import 'package:file_picker/file_picker.dart';
    import 'package:flutter/material.dart';
    import 'package:intl/intl.dart';
    import 'package:flutter_colorpicker/flutter_colorpicker.dart';
    // import 'package:open_file/open_file.dart';

    class CreatePostPage extends StatefulWidget {
    const CreatePostPage({Key? key}) : super(key: key);

    @override
    State<CreatePostPage> createState() => _CreatePostPageState();
    }

    class _CreatePostPageState extends State<CreatePostPage> {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    // GlobalKey<ScaffoldMessengerState> scaffoldMessangerKey =
    //     GlobalKey<ScaffoldMessengerState>();

    // void validateInput() {
    //   if (formKey.currentState!.validate()) {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(const SnackBar(content: Text('Proses')));
    //   }
    // }

    TextEditingController dateinput = TextEditingController();
    TextEditingController colorinput = TextEditingController();
    TextEditingController caption = TextEditingController();
    DateTime currentDate = DateTime.now();
    DateTime? publishDate;
    PlatformFile? pickedFile;
    File? fileToDisplay;
    bool isLoading = false;
    final bool _validateColor = false;

    Color? currentColor;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
            title: const Text('Create Post'),
            centerTitle: false,
        ),
        body: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
            key: formKey,
            child: ListView(
                children: [
                buildFilePicker(),
                const SizedBox(
                    height: 20,
                ),
                buildDatePicker(context),
                const SizedBox(
                    height: 20,
                ),
                buildColorPicker(),
                const SizedBox(
                    height: 20,
                ),
                buildTextField(),
                const SizedBox(
                    height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                        setState(() {
                        formKey.currentState!.validate();
                        });
                        if (dateinput.text.isNotEmpty &&
                            fileToDisplay != null &&
                            caption.text.isNotEmpty &&
                            currentColor != null) {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) => PreviewPage(
                                currentColor: currentColor,
                                dateinput: publishDate,
                                caption: caption.text,
                                coverImage: fileToDisplay,
                            ),
                            ),
                        );
                        }
                    },
                    child: const Text('Simpan')),

                // buildColorPicker
                ],
            ),
            ),
        ),
        );
    }

    Widget buildFilePicker() {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text('Cover'),
            const SizedBox(
            height: 15,
            ),
            SizedBox(
            height: 40,
            width: double.infinity,
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: () async {
                        _pickFile();
                    },
                    child: const Text('Pilih File')),
            ),
            if (pickedFile != null)
            SizedBox(
                height: 150,
                width: 400,
                child: Image.file(fileToDisplay!),
            ),
        ],
        );
    }

    void _pickFile() async {
        setState(() {
        isLoading = true;
        });
        final result = await FilePicker.platform.pickFiles();
        if (result != null) {
        pickedFile = result.files.first;
        fileToDisplay = File(pickedFile!.path.toString());
        }

        setState(() {
        isLoading = false;
        });
    }

    // void _openFile(PlatformFile file){}

    Widget buildDatePicker(BuildContext context) {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text('Publish At'),
            const SizedBox(
            height: 15,
            ),
            SizedBox(
            height: 40,
            width: double.infinity,
            child: TextFormField(
                validator: (value) {
                if (value!.isEmpty) {
                    return 'Date Can\'t be Empty';
                }
                return null;
                },
                controller: dateinput,
                decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: OutlineInputBorder(),
                icon: Icon(Icons.calendar_today),
                hintText: 'dd/mm/yyyy',
                ),
                readOnly: true,
                onTap: () async {
                final selectDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(currentDate.year + 5),
                );
                if (selectDate != null) {
                    String formattedDate =
                        DateFormat('dd/MM/yyyy').format(selectDate);
                    setState(() {
                    publishDate = selectDate;
                    dateinput.text = formattedDate;
                    });
                } else {}
                },
            ),
            ),
        ],
        );
    }

    Widget buildColorPicker() {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text('Color Theme'),
            const SizedBox(
            height: 15,
            ),
            SizedBox(
            height: 40,
            child: TextFormField(
                validator: (value) {
                if (value!.isEmpty) {
                    return 'Color can\'t be Empty';
                }
                return null;
                },
                controller: colorinput,
                decoration: InputDecoration(
                    hintText: 'Pick a Color',
                    contentPadding: const EdgeInsets.only(left: 10),
                    border: const OutlineInputBorder(),
                    errorText: _validateColor ? 'Color Can\'t Be Empty' : null),
                onTap: (() {
                showDialog(
                    context: context,
                    builder: (context) {
                    return AlertDialog(
                        title: const Text('Pick a Color'),
                        content: SingleChildScrollView(
                        child: ColorPicker(
                            pickerColor: Colors.red,
                            onColorChanged: (color) {
                            setState(() {
                                colorinput.text = currentColor.toString();
                                currentColor = color;
                            });
                            },
                        ),
                        ),
                    );
                    },
                );
                }),
            ),
            ),
        ],
        );
    }

    Widget buildTextField() {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text('Caption'),
            const SizedBox(
            height: 15,
            ),
            TextFormField(
            validator: (value) {
                if (value!.isEmpty) {
                return 'Caption tidak boleh kosong';
                }
                return null;
            },
            maxLines: 8,
            controller: caption,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
            ),
            ),
        ],
        );
    }
    }

#### generated_plugin_registrant.dart
    //
    // Generated file. Do not edit.
    //

    // ignore_for_file: directives_ordering
    // ignore_for_file: lines_longer_than_80_chars
    // ignore_for_file: depend_on_referenced_packages

    import 'package:file_picker/_internal/file_picker_web.dart';

    import 'package:flutter_web_plugins/flutter_web_plugins.dart';

    // ignore: public_member_api_docs
    void registerPlugins(Registrar registrar) {
    FilePickerWeb.registerWith(registrar);
    registrar.registerMessageHandler();
    }

#### preview_page.dart
    // ignore_for_file: public_member_api_docs, sort_constructors_first
    import 'package:flutter/material.dart';
    import 'package:intl/intl.dart';

    class PreviewPage extends StatefulWidget {
    final dateinput;
    final currentColor;
    final caption;
    final coverImage;

    const PreviewPage(
        {super.key,
        required this.dateinput,
        required this.currentColor,
        required this.caption,
        required this.coverImage});

    // const PreviewPage(
    //     {this.dateinput, this.currentColor, this.caption, this.coverImage});

    @override
    State<PreviewPage> createState() => _PreviewPageState();
    }

    class _PreviewPageState extends State<PreviewPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
            title: const Text('Preview Post'),
        ),
        body: Column(
            children: [
            // if (widget.coverImage != null)
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                height: 200,
                width: 400,
                child: Image.file(widget.coverImage),
                ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                children: [
                    const Text('Published:'),
                    const SizedBox(
                    width: 5,
                    ),
                    Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text(DateFormat.yMMMd().format(widget.dateinput)),
                        Row(
                            children: [
                            const Text('Color: '),
                            Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: widget.currentColor),
                            )
                            ],
                        ),
                        ],
                    ),
                    ),
                ],
                ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                widget.caption,
                textAlign: TextAlign.center,
                ),
            )
            ],
        ),
        );
    }
    }

### Output
![1](../screenshots/output1.png)
![2](../screenshots/output2.png)
![3](../screenshots/output3.png)
![4](../screenshots/output4.png)