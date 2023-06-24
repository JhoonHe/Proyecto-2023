import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ClientService } from 'src/app/services/client.service';

@Component({
  selector: 'app-detalle-prenda',
  templateUrl: './detalle-prenda.component.html',
  styleUrls: ['./detalle-prenda.component.css']
})
export class DetallePrendaComponent implements OnInit {

  idPrenda: number;
  prenda: any;
  // valorIdPrenda: number;

  constructor(private routeActivate: ActivatedRoute, private client: ClientService) {

  }

  ngOnInit(): void {
    this.idPrenda = this.routeActivate.snapshot.params["id"];
    console.log("ID" + this.idPrenda);

    this.client.getRequest(`http://localhost:10101/detalle-prenda/${this.idPrenda}`).subscribe(
      ((response: any) => {
        // console.log(response);
        this.prenda = response.prendas;

      }),
      ((error: any) => {
        console.log(error.error.Status);
        console.log(error);

      })
    );
  }

}
