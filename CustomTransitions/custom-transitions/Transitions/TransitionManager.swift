//
//  TransitionManager.swift
//  custom-transitions
//
//  Created by Bruno Lorenzo on 5/4/21.
//

import UIKit

final class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning {

    private let duration: TimeInterval
    private var operation: UINavigationController.Operation?

    init(duration: TimeInterval) {
        self.duration = duration
    }

    func transitionDuration(using transitionContext: (any UIViewControllerContextTransitioning)?) -> TimeInterval {
        self.duration
    }
    
    func animateTransition(using transitionContext: any UIViewControllerContextTransitioning) {
        guard
            let from = transitionContext.viewController(forKey: .from),
            let to = transitionContext.viewController(forKey: .to)
        else {
            transitionContext.completeTransition(false)
            return
        }

        animateTransition(from: from, to: to, with: transitionContext)
    }
}

// MARK: - UINavigationControllerDelegate

extension TransitionManager: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController
                              , to toVC: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {

        self.operation = operation

        if operation == .push {
            return self
        }

        return nil
    }
}


// MARK: - Animations

private extension TransitionManager {
    func animateTransition(from fromViewController: UIViewController,
                           to toViewController: UIViewController,
                           with context: UIViewControllerContextTransitioning) {
        switch operation {
        case .push:
            guard let albumsController = fromViewController as? AlbumsViewController,
                  let detailController = toViewController as? AlbumDetailViewController
            else { return }

            presentController(from: albumsController, to: detailController, with: context)
        case .pop:
            guard let albumsController =  toViewController as? AlbumsViewController,
                  let detailController = fromViewController as? AlbumDetailViewController
            else { return }

            popController(from: detailController, to: albumsController, with: context)
        default:
            break
        }
    }

    func presentController(from fromViewController: AlbumsViewController,
                           to toViewController: AlbumDetailViewController,
                           with context: UIViewControllerContextTransitioning) {
        guard
            let albumCell = fromViewController.currentCell,
            let albumsCoverImageView = fromViewController.currentCell?.albumCoverImageView,
            let albumsHeaderView = toViewController.headerView
        else { return }

        toViewController.view.layoutIfNeeded()

        let containerView = context.containerView

        let snapshotContentView = UIView()
        snapshotContentView.backgroundColor = .albumBackgroundColor
        snapshotContentView.frame = containerView.convert(albumCell.contentView.frame, from: albumCell
        )
        snapshotContentView.layer.cornerRadius = albumsCoverImageView.layer.cornerRadius

        let snapshotAlbumCoverImage = UIImageView()
        snapshotAlbumCoverImage.clipsToBounds = true
        snapshotAlbumCoverImage.contentMode = albumsCoverImageView.contentMode
        snapshotAlbumCoverImage.image = albumsCoverImageView.image
        snapshotAlbumCoverImage.layer.cornerRadius = albumsCoverImageView.layer.cornerRadius
        snapshotAlbumCoverImage.frame = containerView.convert(albumsCoverImageView.frame, from: albumCell)

        containerView.addSubview(toViewController.view)
        containerView.addSubview(snapshotContentView)
        containerView.addSubview(snapshotAlbumCoverImage)

        toViewController.view.isHidden = true

        let animator = UIViewPropertyAnimator(duration: duration, curve: .easeIn) {
            snapshotContentView.frame = containerView.convert(toViewController.view.frame, from: toViewController.view)
            snapshotAlbumCoverImage.frame = containerView.convert(albumsHeaderView.albumCoverImageView.frame, from: albumsHeaderView)
            snapshotAlbumCoverImage.layer.cornerRadius = 0
        }

        animator.addCompletion { _ in
            toViewController.view.isHidden = false
            snapshotContentView.removeFromSuperview()
            snapshotAlbumCoverImage.removeFromSuperview()
            context.completeTransition(true)
        }

        animator.startAnimation()
    }

    func popController(from fromViewController: AlbumDetailViewController,
                       to toViewController: AlbumsViewController,
                       with context: UIViewControllerContextTransitioning) {

    }
}
