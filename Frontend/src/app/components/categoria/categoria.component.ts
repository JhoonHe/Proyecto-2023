import { Component, OnInit } from '@angular/core';
import { ClientService } from 'src/app/services/client.service';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-categoria',
  templateUrl: './categoria.component.html',
  styleUrls: ['./categoria.component.css']
})
export class CategoriaComponent {

  nombreCategoria: string;
  ropa: any;

  constructor(private client: ClientService, private router: Router, private routeActivate: ActivatedRoute) {

  }

  ngOnInit(): void {
    this.nombreCategoria = this.routeActivate.snapshot.params["categoria"];
    console.log(this.nombreCategoria);

    this.client.getRequest(`http://localhost:10101/categorias/${this.nombreCategoria}`).subscribe(
      ((response: any) => {
        this.ropa = response.prendas;  
        console.log(response);
        
      }),
      ((error: any) => {
        console.log(error.error.Status);

      })
    );
  }

  verPrenda(id_prenda: number) {
    console.log(id_prenda);
    this.router.navigate(['/detalle-prenda', id_prenda]);
  }

}
