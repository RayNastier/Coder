import { Component, OnInit } from '@angular/core';
import { udemy } from '../data/udemy';

@Component({
  selector: 'app-udemy-listing',
  templateUrl: './udemy-listing.component.html',
  styleUrls: ['./udemy-listing.component.css']
})
export class UdemyListingComponent implements OnInit {

  udemy: Array<any> = udemy;

  constructor() { }

  ngOnInit(): void {
  }
}
