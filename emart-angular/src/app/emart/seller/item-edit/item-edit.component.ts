import { Component, OnInit } from '@angular/core';
import { EmartService } from 'src/app/emart.service';

@Component({
  selector: 'app-item-edit',
  templateUrl: './item-edit.component.html',
  styleUrls: ['./item-edit.component.css']
})
export class ItemEditComponent implements OnInit {
  constructor(protected emartService:EmartService) { }

  ngOnInit(): void {
  
  }
}

