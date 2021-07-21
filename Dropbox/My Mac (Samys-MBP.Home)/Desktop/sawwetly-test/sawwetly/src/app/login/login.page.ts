import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {
  hidden: boolean;
  constructor(private navCtrl: NavController, public alertController: AlertController) { }

  ngOnInit() {
  }
  goToProfile(): void {
    this.navCtrl.navigateRoot(['profile']);
  }
  SignUp(): void{
    this.hidden = true;

    var signUp = document.createElement('ion-text');
    signUp.id = 'signupp'
    var line1 = document.createTextNode('لإنشاء حساب يرجى الإتصال بنى على الإميل');
    var line2 = document.createTextNode(' contact@sawitly.com ');
    var line3 = document.createTextNode('أو على الرقم  0770954070');
    signUp.appendChild(line1);
    signUp.appendChild(line2);
    signUp.appendChild(line3);
    var show = document.getElementById('signUp');
    show.style.width = '80%';
    show.className = 'ion-text-center';
    show.style.fontFamily = 'arabic-bold';
    show.style.fontSize = '25px';
    show.style.marginLeft = '8%';
    show.style.marginBottom = '8%';
    show.style.marginTop = '5%';
    show.style.borderStyle = 'solid';
    show.style.borderColor = 'black';
    show.style.padding = '2%';
    show.appendChild(signUp);
  }
  SignIn(): void{
    this.hidden = false;
    var signUp = document.getElementById('signupp');
    signUp.remove();
  }
  async presentAlertPrompt() {
    const alert = await this.alertController.create({
      cssClass: 'my-custom-class',
      header: 'نسيت كلمة المرور؟',
      inputs: [
        {
          name: 'name1',
          type: 'text',
          placeholder: 'البريد الإلكتروني'
        }
      ]
    });

    await alert.present();
  }
}
