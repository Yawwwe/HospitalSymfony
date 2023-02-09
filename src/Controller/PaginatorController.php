<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


use Knp\Component\Pager\PaginatorInterface;

use App\Entity\Product;



class PaginatorController extends AbstractController
{
 
	
    /**
     * @Route("/paginator", name="paginator_listado", methods={"GET","POST"})
     */
	public function index(Request $request, PaginatorInterface $paginator)
    {
        // Recuperar el administrador de entidades de Doctrine
        $em = $this->getDoctrine()->getManager();
        
       
	$query = $em->createQuery('SELECT p FROM App:Pregunta p order by p.id');
		
        // Paginar los resultados de la consulta
        $pagination = $paginator->paginate( 
            // Consulta Doctrine, no resultados
            $query,
            // Definir el parámetro de la página
            $request->query->getInt('page', 1),
            // Items per page
            5
        );
        
        // Renderizar la vista de twig
        return $this->render('paginator/listado.html.twig', ['pagination' => $pagination ]);
    }
}

