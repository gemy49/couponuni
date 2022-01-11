import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

void navigateToAndDelete({
  required screen,
  required context,
})=>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(
      builder: (context)=>screen,), (route) => false
    );
void navigateTo({
  required context,
  required screen
}) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => screen,
  ),
);
Widget buildTaskItem(data,context) => InkWell(
  onTap: (){
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(data['url'])));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child:   Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:DecorationImage(
              image:data['image']==null? const NetworkImage('https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg'):
            NetworkImage('${data['image']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20.0,),
        Expanded(
          child: SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${data['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Text(
                  '${data['date']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);
Widget divider()=>Container(
  width: double.infinity,
  height: 2.0,
  color: Colors.grey[300],
);
Widget defaultFormField({
  required TextEditingController controller,
  required String label,
  required IconData prefix,
  var onTap,
  var onChange,
  var  type,
  var suffix,
  var function ,
  var validator,
  var decoration,
  bool isPassword = false ,
}
    ) =>
    TextFormField(
      onChanged: onChange,
      validator: validator,
      onTap: onTap,
      obscureText:isPassword ,
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 1.0,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        prefixIcon: Icon(
          prefix,
          color: Colors.black,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: function,
          icon: Icon(
            suffix,
            color: Colors.black,
          ),
        )
            : null,
      ),
    );


class DefaultLoginScreen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var   textcontroller =TextEditingController();
  var  passwordtcontroller =TextEditingController();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                const SizedBox(height: 50,),
                defaultFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return 'pleas enter an email';
                    }
                    return null;
                  },
                  prefix:Icons.email,
                  controller: textcontroller,
                  label: 'email',
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(height: 50,),
                defaultFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return 'pleas enter an password';
                      }
                      return null;
                    },
                    prefix:Icons.lock,
                    controller: passwordtcontroller,
                    label: 'password',
                    type: TextInputType.visiblePassword,
                    suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                    isPassword: isPassword,
                    function: (){
                      // setState(() {
                      //   isPassword=!isPassword;
                      // });
                    }
                ),
                SizedBox(height: 50,),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    child: const Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),),
                    height: 50,
                    onPressed: (){
                      // if(formKey.currentState!.validate()) {
                      //   navigateToAndDelete(
                      //       screen: HomeScreen(), context: context);
                      //
                      // }
                     },
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Text('Don\'t have an account now',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    TextButton(
                      onPressed: (){
                        // navigateTo(screen: HomeScreen(), context: context);
                      },
                      child:  const Text('REGISTER',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
