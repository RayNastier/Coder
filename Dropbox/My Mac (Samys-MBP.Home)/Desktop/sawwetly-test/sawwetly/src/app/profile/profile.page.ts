import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import { Profile } from './profile.model';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.page.html',
  styleUrls: ['./profile.page.scss'],
})
export class ProfilePage implements OnInit {
  profile: Profile = {
    firstname: "اسامة",
    lastname: "معاد",
    list: "HSM",
    bio: "من افضل ما كان",
    town: "الجزائر العاصمة",
    company: "صوناطراك",
    job: "مدير عام",
    age: 34,
    location: "سعيد حمدين",
    academic: "باكالوريا + 5 سنوات إدارة",
    experience: 7,
    volunteer: "دار العجزة",
    facebook: "https://www.facebook.com/take.uwvsy",
    twitter: "https://twitter.com/MhDSaMy",
    instagram: "https://www.instagram.com/raynmore.off/",
    youtube: "https://www.youtube.com/channel/UC5HVAsPUogSFBoQuWGdnizg"
  }


  disabled: boolean = true;
  editing: boolean = false;
  saveIt: boolean = false;
  resetIt: boolean = false;
  constructor(private navCtrl: NavController) { }

  ngOnInit() {
  }
  goToLogin(): void {
    this.navCtrl.navigateRoot(['login']);
  }
  edit(): void{
    this.disabled = false;


    var reset = document.createElement('ion-button');
    reset.color = 'primary';
    reset.expand = "block";
    reset.style.width = '80%';
    reset.style.marginLeft = '11%';
    // reset.onclick = this.reset(save, reset);
    // reset.click = this.reset(save, reset);
    

    var save = document.createElement('ion-button');
    save.id = '#save';
    save.color = 'success';
    save.expand = "block";
    save.style.width = '80%';
    save.style.marginLeft = '11%';
    // save.onclick = this.save(save, reset);

    this.editing = true;
    var socialRow = document.getElementById('socialrow');
    socialRow.remove();

    var newSocial = document.createElement('ion-card');
    var header = document.createElement('ion-card-header');
    var headerText = document.createTextNode('تواصل معي');
    header.className = 'ion-text-right';
    header.style.fontFamily = 'arabic-bold';
    header.appendChild(headerText);
    newSocial.appendChild(header);

    
    var facebook = document.createElement('ion-input');
    facebook.value = 'http://www.facebook.com/';
    var twitter = document.createElement('ion-input');
    twitter.value = 'http://www.twitter.com/';
    var instagram = document.createElement('ion-input');
    instagram.value = 'http://www.instagram.com/';
    var youtube = document.createElement('ion-input');
    youtube.value = 'http://www.youtube.com/';


    var facebookIco = document.createElement('ion-icon');
    var twitterIco = document.createElement('ion-icon');
    var instagramIco = document.createElement('ion-icon');
    var youtubeIco = document.createElement('ion-icon');


    facebookIco.name = 'logo-facebook';
    twitterIco.name = 'logo-twitter';
    instagramIco.name = 'logo-instagram';
    youtubeIco.name = 'logo-youtube';


    facebook.appendChild(facebookIco);
    twitter.appendChild(twitterIco);
    instagram.appendChild(instagramIco);
    youtube.appendChild(youtubeIco);

    facebookIco.style.color = '#4267B2';
    facebookIco.style.marginLeft = '5%';
    facebookIco.style.marginRight = '2%';
    facebook.style.borderStyle = 'solid';
    facebook.style.borderRadius = '10px';
    facebook.style.width = '90%';
    facebook.style.marginLeft = '5%';
    facebook.style.marginBottom = '20px';
    facebook.style.borderColor = '#05d6a9';


    twitterIco.style.color = '#1DA1F2';
    twitterIco.style.marginLeft = '5%';
    twitterIco.style.marginRight = '2%';
    twitter.style.borderStyle = 'solid';
    twitter.style.borderRadius = '10px';
    twitter.style.width = '90%';
    twitter.style.marginLeft = '5%';
    twitter.style.marginBottom = '20px';
    twitter.style.borderColor = '#05d6a9';


    instagramIco.style.color = '#ec504b';
    instagramIco.style.marginLeft = '5%';
    instagramIco.style.marginRight = '2%';
    instagram.style.borderStyle = 'solid';
    instagram.style.borderRadius = '10px';
    instagram.style.width = '90%';
    instagram.style.marginLeft = '5%';
    instagram.style.marginBottom = '20px';
    instagram.style.borderColor = '#05d6a9';


    youtubeIco.style.color = '#ec504b';
    youtubeIco.style.marginLeft = '5%';
    youtubeIco.style.marginRight = '2%';
    youtube.style.borderStyle = 'solid';
    youtube.style.borderRadius = '10px';
    youtube.style.width = '90%';
    youtube.style.marginLeft = '5%';
    youtube.style.marginBottom = '20px';
    youtube.style.borderColor = '#05d6a9';

    newSocial.appendChild(facebook);
    newSocial.appendChild(twitter);
    newSocial.appendChild(instagram);
    newSocial.appendChild(youtube);

    var oldName = document.getElementById('oldName');
    oldName.remove();

    var nameCard = document.createElement('ion-card');
    
    var newName = document.createElement('ion-input');
    var newJob = document.createElement('ion-input');
    var newList = document.createElement('ion-input');


    newName.value = this.profile.firstname + ' ' + this.profile.lastname;
    newName.className = 'ion-text-right';
    newJob.value = this.profile.job;
    newJob.className = 'ion-text-right';
    newList.value = this.profile.list + ' :القائمة';
    newList.className = 'ion-text-right';
    newList.disabled = true;


    newName.style.borderStyle = 'solid';
    newName.style.borderRadius = '10px';
    newName.style.width = '90%';
    newName.style.marginLeft = '5%';
    newName.style.marginTop = '8%';
    newName.style.marginBottom = '20px';
    newName.style.borderColor = '#05d6a9';


    newJob.style.borderStyle = 'solid';
    newJob.style.borderRadius = '10px';
    newJob.style.width = '90%';
    newJob.style.marginLeft = '5%';
    newJob.style.marginBottom = '20px';
    newJob.style.borderColor = '#05d6a9';


    newList.style.borderStyle = 'solid';
    newList.style.borderRadius = '10px';
    newList.style.width = '90%';
    newList.style.marginLeft = '5%';
    newList.style.marginBottom = '20px';
    newList.style.borderColor = '#05d6a9';


    nameCard.appendChild(newName);
    nameCard.appendChild(newJob);
    nameCard.appendChild(newList);

    var nameDiv = document.getElementById('newName');

    nameDiv.appendChild(nameCard);
    var div = document.getElementById('newSocial');
    div.appendChild(newSocial);
    var textReset = document.createTextNode("إلغاء");
    var textSave = document.createTextNode("حفظ");
    reset.appendChild(textReset);
    reset.style.fontFamily = 'arabic-bold';
    save.appendChild(textSave);
    save.style.fontFamily = 'arabic-bold';
    
    var elementReset = document.getElementById("lastRow");
    var elementSave = document.getElementById("lastRow");


    elementReset.appendChild(reset);
    elementSave.appendChild(save);
  }

  // save(): any{
  //   this.disabled = true;
  //   this.saveIt = true;
  // }
  // reset(save: any, reset: any): any{
  //   this.disabled = true;
  //   save.remove()
  //   reset.remove()
  // }
}
