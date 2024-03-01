library("iSEE")

input_folder <- Sys.getenv("SHINY_INPUT_DIR")
output_folder <- Sys.getenv("SHINY_OUTPUT_DIR")

if((input_folder == '' || !dir.exists(input_folder))) {
  
  # run "as server", basically without dataset specified
  app_iSEE <- iSEE()
  shiny::runApp(app_iSEE, launch.browser = FALSE, port = 3838, host = "0.0.0.0")
} else {
  se_obj_path <- file.path(input_folder, "se.RDS")
  
  # initial config? TODO
  
  # different ways of loading in the data? TODO
  
  if(!file.exists(se_obj_path)) {
    # run "as server", basically without dataset specified
    app_iSEE <- iSEE()
    shiny::runApp(app_iSEE, launch.browser = FALSE, port = 3838, host = "0.0.0.0")
  } else {
    se_obj <- readRDS(se_obj_path)
    app_iSEE <- iSEE(se = se_obj)
    shiny::runApp(app_iSEE, launch.browser = FALSE, port = 3838, host = "0.0.0.0")
  }
}


# TODO: this one handles the output parts





# if(exists("ideal_env")) {
#   # convert to list for easier handling
#   ideal_env_list <- as.list(ideal_env)
#   
#   if(length(ideal_env_list) > 0) {
#     
#     if(output_folder == "" || !dir.exists(output_folder)) {
#       # I have some form of env to save, but the output folder is mis-specified
#       
#     } else {
#       saveRDS(ideal_env_list[[1]], file = file.path(output_folder, "ideal_env_inputvalues.RDS"))
#       saveRDS(ideal_env_list[[2]], file = file.path(output_folder, "ideal_env_reactivevalues.RDS"))
#       
#       message('We saved it in ', file.path(output_folder, "ideal_env_inputvalues.RDS"))
#     }
#   } else {
#     # do something to force closing (?) 
#   }
# }
