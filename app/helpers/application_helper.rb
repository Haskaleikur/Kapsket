module ApplicationHelper

    def is_admin?
        #SI le user n'est pas admin, on le redirige vers l'accueil
        unless current_user.is_admin == true
          redirect_to root_path
        end
    
      end
      
end
