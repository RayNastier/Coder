import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UdemyListingComponent } from './udemy-listing.component';

describe('UdemyListingComponent', () => {
  let component: UdemyListingComponent;
  let fixture: ComponentFixture<UdemyListingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UdemyListingComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UdemyListingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
