
% Devuelve una matriz feats de tama�o PxN, donde P es el n�mero de
% pacientes y N el n�mero de clases diferentes en labels (args.labels ser�
% un vector con 0 en caso Normal, 1 en caso ADT-1, 2 en caso ADT-2, etc...)

function [error, msj, feats, options] = proj_pca(args)
    error = 0; msj = ''; feats = []; options = args.options;

    if isempty (options)
        clases = unique(args.labels);
        for clase=1:numel(clases)
            y(clase, :) = mean(args.imgs(args.labels==clases(clase),:));
        end

        [coeff, options] = princomp(y');
    end

    feats = args.imgs(:,:) * options;



