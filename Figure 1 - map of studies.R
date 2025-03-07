library(ggplot2)
library(dplyr)
library(scatterpie)
library(ggstar)

SSA_adm0<- sf::st_read("data/GADM_Africa_Admin0.shp")


coords<-read.csv("data/coordinates_for_MAP.csv")


pdf("fig1map_updated.pdf",width = 10, height = 5)

ggplot() + theme_bw()+ 
  theme(panel.background = element_blank(),
        panel.border = element_blank(),
        panel.grid = element_blank(),
        legend.spacing.y = unit(1.0, 'cm'),
        legend.title = element_blank(),
        legend.text=element_text(size=14),
        legend.position = "top",
        axis.title = element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())+  
  guides(fill = guide_legend(byrow = TRUE))+
  geom_sf(data=SSA_adm0, color=alpha("black", 0.8), size=0.8, fill="#CCFFFF")+
  ggstar::geom_star(data = coords, aes(Lon, Lat), color="black", fill="purple", alpha=0.4, size=6) 
dev.off()

###for the insert:

pdf("fig1map_insert_updated.pdf",width = 10, height = 5)


ggplot() + theme_bw()+ 
  theme(panel.background = element_blank(),
        panel.border = element_blank(),
        panel.grid = element_blank(),
        legend.spacing.y = unit(1.0, 'cm'),
        legend.title = element_blank(),
        legend.text=element_text(size=14),
        legend.position = "top",
        axis.title = element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank())+  
  guides(fill = guide_legend(byrow = TRUE))+
  geom_sf(data=SSA_adm0, color=alpha("black", 0.8), size=0.8, fill="#CCFFFF")+
  ggstar::geom_star(data = coords, aes(Lon, Lat), color="black", fill="purple", alpha=0.4, size=6)+
  ylim(-27,-25)+ xlim(31.5,33.5)
dev.off()




