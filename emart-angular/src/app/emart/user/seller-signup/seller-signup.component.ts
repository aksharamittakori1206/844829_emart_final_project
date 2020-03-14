import { Component, OnInit } from '@angular/core';
import { EmartService } from 'src/app/emart.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-seller-signup',
  templateUrl: './seller-signup.component.html',
  styleUrls: ['./seller-signup.component.css']
})
export class SellerSignupComponent implements OnInit {
  seller: any;
  constructor(protected emartService: EmartService, protected router: Router) {
    this.seller = {
      username: '',
      password: '',
      company: '',
      brief: '',
      gst: '',
      address: '',
      email: '',
      website: '',
      contact: ''

    }
  }

  ngOnInit(): void {
  }

  addSeller() {

    this.emartService.addSeller(this.seller).subscribe(
      (response: any) => {
      }
    );
    this.router.navigate(['']);
  }
}
